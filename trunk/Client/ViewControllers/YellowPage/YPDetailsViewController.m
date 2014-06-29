//
//  YPDetailsViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "YPDetailsViewController.h"

#import "AppDelegate.h"
#import "HomeTabBarController.h"
#import "YPAdModel.h"

@interface YPDetailsViewController ()

@end

@implementation YPDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
           andAdModel:(YPAdModel *)ypAd
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _ypAd = ypAd;
    }
    return self;
}

-(void)setData
{
    _adTitle.text = _ypAd.Title;
    _description.text = _ypAd.Content;
    _author.text = _ypAd.AccountName;
    _zone.text = _ypAd.ServiceRegion;
    _adTime.text = _ypAd.PostDate;
   // _category.text = _ypAd.
    _phone.text = _ypAd.Phone;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AppDelegate GetAppDelegate].tabBarController.tabBarHiddenAnimation = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"信息详情";
    [self setData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
