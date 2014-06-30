//
//  RegisterViewController.h
//  Login_Register
//
//  Created by Mac on 14-3-26.
//  Copyright (c) 2014年 NanJingXianLang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"


@interface RegisterViewController : UIViewController<DataRequestDelegate>
{
}

@property (nonatomic,strong) UITableView *registerTableView;


@end
