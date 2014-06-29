//
//  MagDetailsViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"
#import "ArticleModel.h"

@interface MagDetailsViewController : UIViewController
{
    ArticleModel *article;
}

@property (nonatomic, strong) IBOutlet UIView *bottomView;
@property (nonatomic, strong) IBOutlet UIButton *commentBtn;
@property (nonatomic, strong) IBOutlet UIButton *shareButton;
@property (nonatomic, strong) IBOutlet UIView *shareView;

@property (nonatomic, strong) IBOutlet UIScrollView *background;
@property (nonatomic, strong) IBOutlet UILabel *articleTitle;
@property (nonatomic, strong) IBOutlet ITTImageView *bigImage;
@property (nonatomic, strong) IBOutlet UITextView *articleContent;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
              andData:(ArticleModel *)article;
-(void)setData:(ArticleModel *)article;
-(IBAction)shareButton:(id)sender;
-(IBAction)commentBtn:(id)sender;

-(IBAction)shareToSina:(id)sender;
-(IBAction)sharetoTencent:(id)sender;
-(IBAction)sharetoTencentQuan:(id)sender;
-(IBAction)sharetoQQ:(id)sender;
-(IBAction)cancelButton:(id)sender;
@end
