//
//  BigBookView.m
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import "BigImageCell.h"
#import "ITTImageView.h"

@interface BigImageCell()<ITTImageViewDelegate>
{
}
@end

@implementation BigImageCell

+(id)loadFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] objectAtIndex:0];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}


@end
