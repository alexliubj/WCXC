//
//  BigBookView.h
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"

@interface BigImageCell : UITableViewCell
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) IBOutlet ITTImageView *bigImage;
@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
+(id)loadFromXib;
@end
