//
//  YPPostAdViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"


@interface YPPostAdViewController : UIViewController<DataRequestDelegate>
{
    
}

@property (nonatomic,strong) IBOutlet UILabel *adTitle;
@property (nonatomic,strong) IBOutlet UITextView *description;
@property (nonatomic, strong) IBOutlet UILabel *author;
@property (nonatomic, strong) IBOutlet UILabel *zone;
@property (nonatomic,strong) IBOutlet UILabel *adTime;
@property (nonatomic, strong) IBOutlet UILabel *category;
@property (nonatomic, strong) IBOutlet UILabel *phone;

@end
