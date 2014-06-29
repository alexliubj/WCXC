//
//  MagCommentsViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTBaseDataRequest.h"

@interface MagCommentsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DataRequestDelegate>
{
    NSMutableArray *commentArray;
    int page;
    int commentComment;
    int _articleId;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
         andArticleId:(int)articleId;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end
