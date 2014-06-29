//
//  AddNewCardViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-20.
//
//

#import "AddNewCardViewController.h"

#import "AppDelegate.h"
#import "HomeTabBarController.h"

@interface AddNewCardViewController ()

@end

@implementation AddNewCardViewController


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
