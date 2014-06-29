//
//  MagazineMainViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"


@interface MagazineMainViewController : UIViewController<DataRequestDelegate>
{
    NSMutableArray *articles;
    NSInteger currentIssue;
    BOOL isHeaderRefresh;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
