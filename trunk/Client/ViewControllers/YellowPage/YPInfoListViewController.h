//
//  YPInfoListViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"


@interface YPInfoListViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate,DataRequestDelegate>
{
    NSMutableArray *infoArray;
    int _categoryId;
    BOOL isHeaderRefresh;
    int currentPage;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
        andCategoryId:(int)categoryId;
@end
