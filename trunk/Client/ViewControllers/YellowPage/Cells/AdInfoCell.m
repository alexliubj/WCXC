//
//  BigBookView.m
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import "AdInfoCell.h"
#import "ITTImageView.h"

@interface AdInfoCell()<ITTImageViewDelegate>
{
}


@end

@implementation AdInfoCell

+(id)loadFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] objectAtIndex:0];
}

- (void)dealloc
{
//    [_cellImageView cancelCurrentImageRequest];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}


@end
