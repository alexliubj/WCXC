//
//  MagCommentsViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "MagCommentsViewController.h"

#import "AppDelegate.h"
#import "HomeTabBarController.h"
#import "MagPostCmtViewController.h"
#import "MagComments.h"
#import "ArticleModel.h"
#import "DemoDataRequest.h"
#import "MJRefresh.h"
#import "ArticleComment.h"
#import "FeedViewController.h"

@interface MagCommentsViewController ()

@end

@implementation MagCommentsViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [commentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"NewMagazineCell";
    MagComments *newMagazine = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (newMagazine == nil) {
        newMagazine = [MagComments loadFromXib];
    }
    
    ArticleComment *model= [[ArticleComment alloc] init];
    model = [commentArray objectAtIndex:indexPath.row];
    
    newMagazine.commentContent.text = model.CommentContent;
    newMagazine.lblUserName.text = model.AccountName;
    return newMagazine;
}

-(void)getCommentsWithPageNum:(int)pageNum
{
        NSDictionary *params = @{@"articleID": [NSString stringWithFormat:@"%d",_articleId]};
        [GetAllCommentsByArticleRequest requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"GetAllCommentsByArticleRequest" onRequestFinished:^(ITTBaseDataRequest *request){
            
        
        if(((NSArray *)request.handleredResult[@"commentList"]).count >0 )
        {
           // if(isHeaderRefresh)

            [commentArray removeAllObjects];
            [commentArray addObjectsFromArray:request.handleredResult[@"commentList"]];
            self.tableView.scrollsToTop = YES;
            [self.tableView reloadData];
        }
        else
        {
            //show alert
        }
            [self.tableView headerEndRefreshing];
            [self.tableView footerEndRefreshing];}
        ];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AppDelegate GetAppDelegate].tabBarController.tabBarHidden = TRUE;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [AppDelegate GetAppDelegate].tabBarController.tabBarHidden = FALSE;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
         andArticleId:(int)articleId
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _articleId = articleId;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"评论列表";
    commentArray = [[NSMutableArray alloc] initWithCapacity:10];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(postCmt)];
    
    [self setupRefresh];
    
    

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
   // [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self getCommentsWithPageNum:page];

    });
}

- (void)footerRereshing
{
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getCommentsWithPageNum:page++];
    });
}

-(void)postCmt
{
    FeedViewController *postComment = [[FeedViewController alloc] initWithNibName:@"FeedViewController" bundle:nil andArticleId:_articleId];
    [self.navigationController pushViewController:postComment animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
