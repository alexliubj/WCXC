//
//  BigBookView.h
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"

@interface MagComments : UITableViewCell
+(id)loadFromXib;
@property (nonatomic, strong) IBOutlet UILabel *lblUserName;
@property (nonatomic, strong) IBOutlet UILabel *commentContent;
@property (nonatomic, strong) IBOutlet UILabel *cmtTime;

@end
