//
//  ITTHiddenTabBarViewController.h
//  iTotemFramework
//
//  Created by jack 廉洁 on 4/1/12.
//  Copyright (c) 2012 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTTabBarView.h"

@interface ITTTabBarController : UITabBarController<ITTCustomTabBarViewDelegate>
{
    BOOL                _tabBarHidden;
    UIView              *_contentView;
    ITTTabBarView       *_customTabBarView;
    BOOL                _tabBarHiddenAnimation;
}

@property (nonatomic, assign) BOOL tabBarHidden;
@property (nonatomic, assign) BOOL tabBarHiddenAnimation;
@property (nonatomic, assign) CGFloat tabHeight;
@property (nonatomic, strong) ITTTabBarView *customTabBarView;
@property (nonatomic, strong, readonly) UIView *contentView;

- (void)setContentViewBounds;

//subclass must override this method to sepcify tabbar class
- (NSString*)tabBarClassName;

@end
