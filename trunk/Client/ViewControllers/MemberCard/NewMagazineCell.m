//
//  BigBookView.m
//  NationalGeography
//
//  Created by xiaoyu on 12-10-9.
//
//

#import "NewMagazineCell.h"
#import "ITTImageView.h"

@interface NewMagazineCell()<ITTImageViewDelegate>
{
}


@end

@implementation NewMagazineCell

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
    _cellImageView.delegate = self;
}

- (void)setUrl:(NSString *)url
{
    _url = url;
    [_cellImageView cancelCurrentImageRequest]; //it is fatal here, otherwise app will crash
    [_cellImageView loadImage:_url placeHolder:[UIImage imageNamed:@"placeholder.png"]];
}

#pragma mark - ITTImageViewDelegate
- (void)imageViewDidChangeProgress:(ITTImageView *)imageView progress:(CGFloat)progress
{
    ITTDINFO(@"progress %f", progress);    

}

@end
