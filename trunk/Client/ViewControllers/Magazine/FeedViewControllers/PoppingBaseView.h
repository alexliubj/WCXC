//
//  PoppingBaseView.h  
//
//  Created by Yan Guanyu on 5/29/12.
//  Copyright (c) 2012 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PoppingBaseView : UIView

+ (id)viewFromNib;
- (void)show;
- (void)cancel;

//Subclass
- (void)didShow;
- (void)willCancel:(BOOL)isAutoCancel;
- (void)didCancel;

//Animation
+ (CAKeyframeAnimation*)scaleAnimation:(BOOL)show;

@end
