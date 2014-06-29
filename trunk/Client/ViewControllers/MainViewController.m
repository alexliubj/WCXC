//
//  MainViewController.m
//  iTotemMinFramework
//
//  Created by  on 12-8-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "TestDataRequest.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [TestDataRequest requestWithParameters:nil withIndicatorView:self.view withCancelSubject:nil onRequestFinished:^(ITTBaseDataRequest *request){
        NSDictionary *resultDic = request.handleredResult;
        ITTDINFO(@"request.resultDic %@", resultDic);
        ITTDINFO(@"code class info %@", [resultDic[@"result"][@"code"] class]);
    }];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
