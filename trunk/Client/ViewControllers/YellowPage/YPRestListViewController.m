//
//  YPRestListViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "YPRestListViewController.h"
#import "CaiDanViewController.h"
#import "RestCell.h"
#import "DemoDataRequest.h"
#import "RestModel.h"
#import "AppDelegate.h"
#import "HomeTabBarController.h"


@interface YPRestListViewController ()

@end

@implementation YPRestListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AppDelegate GetAppDelegate].tabBarController.tabBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [AppDelegate GetAppDelegate].tabBarController.tabBarHidden = FALSE;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [restList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"RestCell";
    RestCell *restCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (restCell == nil) {
        restCell = [RestCell loadFromXib];
    }
    
    RestModel *model= [[RestModel alloc] init];
    model = [restList objectAtIndex:indexPath.row];

    restCell.restTitle.text = model.Title;
    [restCell.restImage loadImage:model.Image];
    
    return restCell;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CaiDanViewController *canDanVC=[[CaiDanViewController alloc]init];
    [self.navigationController pushViewController:canDanVC animated:YES];
    
}


-(void)GetAllRest
{
    int pageNum = 1;
    NSDictionary *params = @{ @"page":[NSString stringWithFormat:@"%d",pageNum],
                             @"limit":@"2000"};
    
    [GetAllRestRequest requestWithParameters: params withIndicatorView:self.view withCancelSubject:@"GetAllRestRequest" onRequestFinished:^(ITTBaseDataRequest *request){
        [restList addObjectsFromArray:request.handleredResult[@"restList"]];
        // 刷新表格
        [self.tableView reloadData];
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"餐馆列表";
    restList = [[NSMutableArray alloc] initWithCapacity:10];
    [self GetAllRest];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
