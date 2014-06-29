//
//  BigBookView.h
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"

@interface NewMagazineCell : UITableViewCell
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) IBOutlet UILabel *cellTitle;
@property (nonatomic, strong) IBOutlet UILabel *cellDes;
@property (nonatomic, strong) IBOutlet UILabel *cellXuechao;
@property (nonatomic, strong) IBOutlet ITTImageView *cellImageView;
@property (nonatomic, assign) BOOL isXuechaoCard;
+(id)loadFromXib;
@end
