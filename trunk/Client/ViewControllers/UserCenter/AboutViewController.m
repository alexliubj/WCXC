//
//  AboutViewController.m
//  iTotemFrame
//
//  Created by Alex.Liu on 13-8-31.
//  Copyright (c) 2013年 iTotemStudio. All rights reserved.
//

#import "AboutViewController.h"
#import "AppDelegate.h"


#import "AppDelegate.h"
#import "HomeTabBarController.h"

//Settings
@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize description;
@synthesize imageView;



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

-(IBAction)backBtnOnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)startHelpPage
{
//    HelpView *helpView = (HelpView*)[[[NSBundle mainBundle] loadNibNamed:@"HelpView" owner:self options:nil] objectAtIndex:0];
//    [helpView startBookHelp];
}

-(IBAction)redirectToMainPage:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cgctv.com"]];

}

-(void)giveAcall
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://1-888-946-3549"]];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self giveAcall];
    }
}

-(IBAction)Redirect:(id)sender
{
}

-(IBAction)telePhoneOnClick
{
   // [self startHelpPage];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

        NSString *executableversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    self.title = [NSString stringWithFormat:@"Version : %@",executableversion];
    self.description.text = NSLocalizedString(@"aboutDetails", nil);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
