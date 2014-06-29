//
//  BigBookView.h
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"

@interface RestCell : UITableViewCell
@property (nonatomic, strong) NSString *url;
+(id)loadFromXib;

@property (nonatomic,retain) IBOutlet ITTImageView *restImage;
@property (nonatomic, retain) IBOutlet UILabel *restTitle;
@property (nonatomic, retain) IBOutlet UILabel *restDes;

@end
