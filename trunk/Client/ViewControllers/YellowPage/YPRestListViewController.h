//
//  YPRestListViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"

@interface YPRestListViewController : UIViewController<UITableViewDelegate,
UITableViewDataSource,DataRequestDelegate>
{
    NSMutableArray *restList;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
