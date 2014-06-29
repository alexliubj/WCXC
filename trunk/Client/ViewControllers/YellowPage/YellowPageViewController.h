//
//  YellowPageViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "CHTumblrMenuView.h"

@interface YellowPageViewController : UIViewController
{
    CHTumblrMenuView *menuView;
    int _categoryId;
}

@property (nonatomic ,assign) int CategoryId;
-(void)CommonItemSelected:(NSInteger)itemId;
@end
