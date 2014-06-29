//
//  BigBookView.h
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import <UIKit/UIKit.h>

@interface AdInfoCell : UITableViewCell
@property (nonatomic, strong) NSString *url;
+(id)loadFromXib;

@property (nonatomic, strong) IBOutlet UILabel *Adtitle;
@property (nonatomic, strong) IBOutlet UILabel *des;
@property (nonatomic, strong) IBOutlet UILabel *author;
@end
