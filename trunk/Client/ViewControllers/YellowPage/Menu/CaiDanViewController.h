//
//  CaiDanViewController.h
//  fanqieDian
//
//  Created by chenzhihui on 13-11-6.
//  Copyright (c) 2013年 chenzhihui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchTableView.h"
#import "TouchTableViewDelegate.h"
#define MHHeadUrl @"http://api.chenzhihui.com/interface.php?"
#define HEight_3 (HEIGTH-50-20-44)/3
#define HEIGTH [UIScreen mainScreen].bounds.size.height

@interface CaiDanViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TouchTableViewDelegate>
@property(strong,nonatomic)TouchTableView *myTableView;
@property(strong,nonatomic)NSMutableArray *marr;
@property(assign,nonatomic)int buyId;
@end
