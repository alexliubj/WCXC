//
//  BigBookView.m
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import "MagCell.h"
#import "ITTImageView.h"

@interface MagCell()<ITTImageViewDelegate>
{
}

@end

@implementation MagCell

+(id)loadFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] objectAtIndex:0];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}


@end
