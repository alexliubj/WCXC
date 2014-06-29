//
//  AboutViewController.h
//  iTotemFrame
//
//  Created by Alex.Liu on 13-8-31.
//  Copyright (c) 2013年 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"

@interface AboutViewController : UIViewController<UIAlertViewDelegate>

-(IBAction)backBtnOnClick;
-(IBAction)telePhoneOnClick;
-(IBAction)Redirect:(id)sender;
@property (nonatomic, retain) IBOutlet UITextView *description;
@property (nonatomic, retain) IBOutlet UILabel *titleLable;
@property (nonatomic, retain) IBOutlet ITTImageView *imageView;
-(IBAction)redirectToMainPage:(id)sender;
@end
