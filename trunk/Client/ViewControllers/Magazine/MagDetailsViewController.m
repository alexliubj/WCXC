//
//  MagDetailsViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "MagDetailsViewController.h"


#import "AppDelegate.h"
#import "HomeTabBarController.h"
#import "AdInfoCell.h"
#import "MagCommentsViewController.h"
#import "ArticleModel.h"

@interface MagDetailsViewController ()

@end

@implementation MagDetailsViewController

@synthesize bigImage = _bigImage;
@synthesize articleContent = _articleContent;
@synthesize articleTitle = _articleTitle;
-(IBAction)shareToSina:(id)sender
{
}
-(IBAction)sharetoTencent:(id)sender
{
}
-(IBAction)sharetoTencentQuan:(id)sender
{
}
-(IBAction)sharetoQQ:(id)sender
{
}

-(IBAction)shareButton:(id)sender
{
}

-(IBAction)cancelButton:(id)sender
{
}

-(IBAction)commentBtn:(id)sender
{
    MagCommentsViewController *postComment = [[MagCommentsViewController alloc] initWithNibName:@"MagCommentsViewController" bundle:nil andArticleId:[article.ArticleID intValue]];
    [self.navigationController pushViewController:postComment animated:YES];
}

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
andData:(ArticleModel *)articleModel
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        article = articleModel;
    }
    return self;
}

-(void)setContentData
{
    [self.bigImage loadImage:article.ArticleLargeImage];
    self.title = article.ArticleTitle;
    _articleContent.text = article.ArticleContent;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setContentData];
    self.shareView.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
