//
//  YellowPageViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "YellowPageViewController.h"
#import "CHTumblrMenuView.h"
#import "YPRestListViewController.h"
#import "YPInfoListViewController.h"
#import "YPPostAdViewController.h"
#import "DemoDataRequest.h"

@interface YellowPageViewController ()

@end

@implementation YellowPageViewController

@synthesize CategoryId = _categoryId;
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
    self.title = @"黄页";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(postAd)];
    
}

-(void)postAd
{
    YPPostAdViewController *infoList = [[YPPostAdViewController alloc] initWithNibName:@"YPPostAdViewController" bundle:nil];
    [self.navigationController pushViewController:infoList animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self showMenu];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [menuView dismissWithoutAnimation];
}

-(void)CommonItemSelected:(NSInteger)itemId
{
    if(itemId != 1)
    {
        YPInfoListViewController *infoList = [[YPInfoListViewController alloc] initWithNibName:@"YPInfoListViewController" bundle:nil andCategoryId:_categoryId];
        [self.navigationController pushViewController:infoList animated:YES];
    }
    else
    {
        [self RestItemSelected];
    }
}

-(void)RestItemSelected
{
    YPRestListViewController *restList = [[YPRestListViewController alloc] initWithNibName:@"YPRestListViewController" bundle:nil];
    [self.navigationController pushViewController:restList animated:YES];
}

- (void)showMenu
{
    __weak typeof(self) weakSelf = self;
    menuView = [[CHTumblrMenuView alloc] initWithFrame:CGRectMake(0, 50, 320, 500)];
    [menuView addMenuItemWithTitle:@"Text" andIcon:[UIImage imageNamed:@"post_type_bubble_text.png"] andSelectedBlock:^{
        weakSelf.CategoryId = 1;
        [weakSelf CommonItemSelected:weakSelf.CategoryId];
    }];
    [menuView addMenuItemWithTitle:@"Photo" andIcon:[UIImage imageNamed:@"post_type_bubble_photo.png"] andSelectedBlock:^{
        weakSelf.CategoryId = 2;
        [weakSelf CommonItemSelected:weakSelf.CategoryId];
    }];
    [menuView addMenuItemWithTitle:@"Quote" andIcon:[UIImage imageNamed:@"post_type_bubble_quote.png"] andSelectedBlock:^{
        weakSelf.CategoryId = 3;
        [weakSelf CommonItemSelected:weakSelf.CategoryId];
        
    }];
    [menuView addMenuItemWithTitle:@"Link" andIcon:[UIImage imageNamed:@"post_type_bubble_link.png"] andSelectedBlock:^{
        weakSelf.CategoryId = 4;
        [weakSelf CommonItemSelected:weakSelf.CategoryId];
        
    }];
    [menuView addMenuItemWithTitle:@"Chat" andIcon:[UIImage imageNamed:@"post_type_bubble_chat.png"] andSelectedBlock:^{
        weakSelf.CategoryId = 5;
        [weakSelf CommonItemSelected:weakSelf.CategoryId];
    }];
    [menuView addMenuItemWithTitle:@"Video" andIcon:[UIImage imageNamed:@"post_type_bubble_video.png"] andSelectedBlock:^{
        weakSelf.CategoryId = 6;
        [weakSelf CommonItemSelected:weakSelf.CategoryId];
    }];
    
    [menuView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
