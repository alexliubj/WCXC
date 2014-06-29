//
//  BigBookView.h
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"

@interface MagCell : UITableViewCell
@property (nonatomic, strong) NSString *url;
+(id)loadFromXib;
@property (nonatomic, strong) IBOutlet ITTImageView *bigImage;
@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
@end
