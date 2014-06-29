//
//  YPPostAdViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "YPPostAdViewController.h"

#import "AppDelegate.h"
#import "HomeTabBarController.h"

#import "ITTCommonFunctions.h"
#import "ITTGobalPaths.h"
#import "ITTCommonMacros.h"
#import "ITTAdditions.h"
#import "AFJSONRequestOperation.h"
#import "DemoDataRequest.h"

@interface YPPostAdViewController ()

@end

@implementation YPPostAdViewController



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
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"发布信息";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(postAd)];
}


-(void)postAd
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tab_1" ofType:@"png"];
    NSData *image = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *params = @{@"AdType": @"1",
                             @"Title": @"title",
                             @"Content": @"112312nice",
                             @"ServiceRegion": @"Scarborough",
                             @"Address": @"1",
                             @"Longitude": @"1",
                             @"Latitude": @"1",
                             @"MemberID": @"1",
                              @"uploaded": image};
    
    [PostAdInfo requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"PostAdInfo" onRequestFinished:^(ITTBaseDataRequest *request){
        
        ITTDINFO(@"request successed");
        
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
