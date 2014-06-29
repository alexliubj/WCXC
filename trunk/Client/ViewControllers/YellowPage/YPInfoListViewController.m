//
//  YPInfoListViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "YPInfoListViewController.h"

#import "AppDelegate.h"
#import "HomeTabBarController.h"
#import "AdInfoCell.h"
#import "YPDetailsViewController.h"
#import "DemoDataRequest.h"
#import "MJRefresh.h"
#import "DemoDataRequest.h"
#import "YPAdModel.h"


@interface YPInfoListViewController ()

@end

@implementation YPInfoListViewController


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
        andCategoryId:(int)categoryId
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _categoryId = categoryId;
        // Custom initialization
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [infoArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"AdInfoCell";
    AdInfoCell *restCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (restCell == nil) {
        restCell = [AdInfoCell loadFromXib];
    }
    
    YPAdModel *model= [[YPAdModel alloc] init];
    model = [infoArray objectAtIndex:indexPath.row];
    restCell.des.text = model.Content;
    restCell.Adtitle. text = model.Title;
    restCell.author.text = model.AccountName;
    
    return restCell;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YPAdModel *model= [[YPAdModel alloc] init];
    model = [infoArray objectAtIndex:indexPath.row];
    YPDetailsViewController *canDanVC=[[YPDetailsViewController alloc] initWithNibName:@"YPDetailsViewController" bundle:nil andAdModel:model];
    
    [self.navigationController pushViewController:canDanVC animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"黄页分类";
    // Do any additional setup after loading the view from its nib.
    
    [self setupRefresh];
    currentPage = 1;
    infoArray = [[NSMutableArray alloc] initWithCapacity:10];
    [self getAdByPageNum:currentPage];
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
        [self getAdByPageNum:1];
    });
}

- (void)footerRereshing
{
    isHeaderRefresh = NO;
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getAdByPageNum:currentPage++];
    });
}

  

-(void)getAdByPageNum:(int)pageNum
{
    //GetAllYelloPageByCategoryIdRequest
    NSDictionary *params = @{@"adType": [NSString stringWithFormat:@"%d",_categoryId],
                             @"page":[NSString stringWithFormat:@"%d",pageNum],
                             @"limit":@"2"};

    [GetAllYelloPageByCategoryIdRequest requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"GetAllYelloPageByCategoryIdRequest" onRequestFinished:^(ITTBaseDataRequest *request){
        if(isHeaderRefresh)
            [infoArray removeAllObjects];
        [infoArray addObjectsFromArray:request.handleredResult[@"adList"]];

        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
        [self.tableView headerEndRefreshing];
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
