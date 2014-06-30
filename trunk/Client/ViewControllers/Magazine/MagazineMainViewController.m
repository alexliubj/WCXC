//
//  MagazineMainViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "MagazineMainViewController.h"
#import "MagDetailsViewController.h"
#import "MagCell.h"
#import "BigImageCell.h"
#import "MJRefresh.h"
#import "ArticleModel.h"
#import "DemoDataRequest.h"


@interface MagazineMainViewController ()
{
    BOOL                        _loading;
    NSInteger                   _limit;
}

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;


@end


@implementation MagazineMainViewController


@synthesize tableView = _tableView;

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setIndicator:nil];
    [super viewDidUnload];
}

- (void)showIndicator:(BOOL)show
{
    if (show) {
        self.indicator.hidden = FALSE;
        [self.indicator startAnimating];
    }
    else {
        self.indicator.hidden = TRUE;
        [self.indicator stopAnimating];
    }
}


-(void)getAllArticleByIssueId:(int)issueId
{
    NSDictionary *params = @{@"articleIssue": [NSString stringWithFormat:@"%d",issueId]};
    [GetAllArticlesRequest requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"GetAllArticlesRequest" onRequestFinished:^(ITTBaseDataRequest *request){
        
        if(((NSArray *)request.handleredResult[@"articleList"]).count >0 )
        {
            [articles removeAllObjects];
            [articles addObjectsFromArray:request.handleredResult[@"articleList"]];
            self.tableView.scrollsToTop = YES;
            [self.tableView reloadData];
        }
        else
        {
            //show alert
        }
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        if(isHeaderRefresh)
        {
            [self.tableView headerEndRefreshing];
        }
        else{
            [self.tableView footerEndRefreshing];
        }
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [articles count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleModel *article = [articles objectAtIndex:indexPath.row];
    if([article.ImagePosition intValue] == 1)
    {
        return 150;
    }
    else
    {
        return 75;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"RestCell";
    UITableViewCell *restCell;
    ArticleModel *article = [articles objectAtIndex:indexPath.row];

    if([article.ImagePosition intValue] == 1)
    {
        restCell = (BigImageCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (restCell == nil) {
            restCell = [BigImageCell loadFromXib];
        }
        [((BigImageCell*)restCell).bigImage loadImage:article.ArticleLargeImage ];
        ((BigImageCell*)restCell).lblTitle. text = article.ArticleTitle;
    }
    else
    {
        restCell =(MagCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (restCell == nil) {
            restCell = [MagCell loadFromXib];
        }
        
        [((MagCell*)restCell).bigImage loadImage:article.ArticleSmallImage ];
        ((MagCell*)restCell).lblTitle.text = article.ArticleTitle;
    }
    //  newMagazine.url = [_images objectAtIndex:indexPath.row];
    return restCell;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleModel *article = [articles objectAtIndex:indexPath.row];

    MagDetailsViewController *canDanVC=[[MagDetailsViewController alloc] initWithNibName:@"MagDetailsViewController" bundle:nil andData:article];
    [self.navigationController pushViewController:canDanVC animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"杂志";
    articles =[[NSMutableArray alloc] initWithCapacity:0];
    currentIssue = 1;
    [self setupRefresh];
    

    [self getAllArticleByIssueId:currentIssue];
  //  [self getAllCommentsByArticleId];
  //  [self postCommentToArticle];
    
    // Do any additional setup after loading the view from its nib.
}


/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];

  //  [self.tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
    isHeaderRefresh = YES;
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        if(currentIssue <= 1)
            [self getAllArticleByIssueId:currentIssue];
        else
            [self getAllArticleByIssueId:--currentIssue];

        
    });
}

- (void)footerRereshing
{
    isHeaderRefresh = NO;
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getAllArticleByIssueId:++currentIssue];
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
