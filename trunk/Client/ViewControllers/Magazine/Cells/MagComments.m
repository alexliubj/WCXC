//
//  BigBookView.m
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import "MagComments.h"
#import "ITTImageView.h"

@interface MagComments()<ITTImageViewDelegate>
{
}

@end

@implementation MagComments

+(id)loadFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] objectAtIndex:0];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}


@end
