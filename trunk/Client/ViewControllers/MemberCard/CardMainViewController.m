//
//  CardMainViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "CardMainViewController.h"
#import "DEMONavigationController.h"
#import "NewMagazineCell.h"
#import "CardDetailsViewController.h"
#import "AddNewCardViewController.h"

#import "ITTCommonFunctions.h"
#import "ITTGobalPaths.h"
#import "ITTCommonMacros.h"
#import "ITTAdditions.h"
#import "AFJSONRequestOperation.h"
#import "DemoDataRequest.h"
#import "MJRefresh.h"
#import "CardModel.h"

@interface CardMainViewController ()

@end

@implementation CardMainViewController
@synthesize tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cardArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"NewMagazineCell";
    NewMagazineCell *newMagazine = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (newMagazine == nil) {
        newMagazine = [NewMagazineCell loadFromXib];
    }
    
    CardModel *model= [[CardModel alloc] init];
    model = [cardArray objectAtIndex:indexPath.row];
    newMagazine.cellDes.text =model.CardDes;
    newMagazine.cellTitle.text = model.CardTitle;
    [newMagazine.cellImageView loadImage:model.FrontViewImage];
    
  //  newMagazine.url = [_images objectAtIndex:indexPath.row];
    return newMagazine;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardDetailsViewController *detail = [[CardDetailsViewController alloc] initWithNibName:@"CardDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:detail animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    cardArray = [[NSMutableArray alloc] initWithCapacity:0];
	self.title = @"会员卡";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(DEMONavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                             action:@selector(addNewCard)];
  //  [self deleteAdInfo];
    [self setupRefresh];
}


/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [self.tableView headerBeginRefreshing];

}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRequest];
    });
}



#pragma start request 

-(void)startRequest
{
    NSDictionary *params = @{@"memberID": @"1"};
    [GetMyCardRequest requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"NewsListCancel" onRequestFinished:^(ITTBaseDataRequest *request){
        [cardArray removeAllObjects];
       [cardArray addObjectsFromArray:request.handleredResult[@"cardList"]];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView headerEndRefreshing];
        
    }];
}


-(void)deleteAdInfo
{
    
    NSDictionary *params = @{@"cardID": @"2"};
    [DeleteCardRequest requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"DeleteCardRequest" onRequestFinished:^(ITTBaseDataRequest *request){
        
        ITTDINFO(@"request successed");
        
    }];
    
    
}
- (void)requestDidStartLoad:(ITTBaseDataRequest*)request
{
    
}

#pragma mark - DataRequestDelegate
- (void)requestDidFinishLoad:(ITTBaseDataRequest*)request
{
    ITTDINFO(@"request successed");
}

- (void)request:(ITTBaseDataRequest *)request didFailLoadWithError:(NSError *)error
{
    ITTDINFO(@"request error %@", error);
}


-(void)TestRegister
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tab_1" ofType:@"png"];
    NSData *image = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *params = @{@"school":@"school",
                             @"major":@"major",
                             @"accountName":@"accountName",
                             @"password":@"password",
                             @"email":@"email",
                              @"phone":@"416-833-4368",
                             @"uploaded":image};
    //    [DemoDataRequest requestWithDelegate:self withParameters:params withIndicatorView:self.view];
    [RegistritionRequest requestWithParameters:params withIndicatorView:nil withCancelSubject:nil onRequestFinished:^(ITTBaseDataRequest *request){
        ITTDINFO(@"block success!");
    }];
}



#pragma end request
-(void)addNewCard
{
    AddNewCardViewController *detail = [[AddNewCardViewController alloc] initWithNibName:@"AddNewCardViewController" bundle:nil];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
