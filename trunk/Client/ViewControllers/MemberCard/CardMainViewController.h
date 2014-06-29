//
//  CardMainViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"
@interface CardMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DataRequestDelegate>
{
    NSMutableArray *cardArray;
}
@property (nonatomic,strong) IBOutlet UITableView *tableView;


@end
