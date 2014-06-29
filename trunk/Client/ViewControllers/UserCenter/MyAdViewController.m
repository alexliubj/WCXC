//
//  MyAdViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-23.
//
//

#import "MyAdViewController.h"

#import "ITTCommonFunctions.h"
#import "ITTGobalPaths.h"
#import "ITTCommonMacros.h"
#import "ITTAdditions.h"
#import "AFJSONRequestOperation.h"
#import "DemoDataRequest.h"

@interface MyAdViewController ()

@end

@implementation MyAdViewController


-(void)startRequest
{
    NSDictionary *params = @{@"memberId": @"1"};
    [GetAdInfoByMemberId requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"GetAdInfoByMemberId" onRequestFinished:^(ITTBaseDataRequest *request){
        
        ITTDINFO(@"request successed");
        
    }];
}

-(void)deleteAd
{
    NSDictionary *params = @{@"adID": @"1"};
    [DeleteAdInfoByMemberId requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"DeleteAdInfoByMemberId" onRequestFinished:^(ITTBaseDataRequest *request){
        
        ITTDINFO(@"request successed");
        
    }];
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
    [self startRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
