//
//  YPDetailsViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"
#import "YPAdModel.h"
@interface YPDetailsViewController : UIViewController<DataRequestDelegate>
{
    YPAdModel *_ypAd;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
           andAdModel:(YPAdModel *)ypAd;
@property (nonatomic,strong) IBOutlet UILabel *adTitle;
@property (nonatomic,strong) IBOutlet UITextView *description;
@property (nonatomic, strong) IBOutlet UILabel *author;
@property (nonatomic, strong) IBOutlet UILabel *zone;
@property (nonatomic,strong) IBOutlet UILabel *adTime;
@property (nonatomic, strong) IBOutlet UILabel *category;
@property (nonatomic, strong) IBOutlet UILabel *phone;
@property (nonatomic, strong) IBOutlet UIScrollView *backgroundView;


@end
