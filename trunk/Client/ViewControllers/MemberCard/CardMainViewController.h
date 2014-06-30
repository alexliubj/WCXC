//
//  CardMainViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"
#import "CardModel.h"
#import "SWTableViewCell.h"
@interface CardMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DataRequestDelegate,SWTableViewCellDelegate>
{
    NSMutableArray *cardArray;
    CardModel *_cardModel;
}
@property (nonatomic,strong) IBOutlet UITableView *tableView;


@end
