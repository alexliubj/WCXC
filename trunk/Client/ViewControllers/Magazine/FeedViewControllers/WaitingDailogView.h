//
//  WatingDailogView.h
//  WebBook
//
//  Created by lt ji on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitingDailogView : UIView{
    UIActivityIndicatorView * _indicatorView;
    UILabel *_loadLabel;
    UIView *_midView;
}
+(WaitingDailogView*)shareView;
-(void)startLoading:(UIView*)view withTitle:(NSString*)title;
- (void)removeLoading;
@end
