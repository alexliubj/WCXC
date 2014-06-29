//
//  WatingDailogView.m
//  WebBook
//
//  Created by lt ji on 11-12-11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "WaitingDailogView.h"
static WaitingDailogView *shareView = nil;
@implementation WaitingDailogView

- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        _midView = [[UIView alloc] init];
        _midView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        _midView.backgroundColor = [UIColor blackColor];
        _midView.alpha = 1.0;
        _midView.layer.cornerRadius =10;
        _midView.layer.masksToBounds = YES;
        [self addSubview:_midView];
        
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _indicatorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_indicatorView];
        
        _loadLabel = [[UILabel alloc] init];
        _loadLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        _loadLabel.backgroundColor = [UIColor clearColor];
        _loadLabel.opaque = YES;
        _loadLabel.textAlignment = UITextAlignmentCenter;
        _loadLabel.textColor = [UIColor whiteColor];
        [self addSubview:_loadLabel];
    }
    return self;
}

+(WaitingDailogView*)shareView{
    @synchronized(self) {
		if ( shareView == nil ) {
			shareView = [[self alloc] init];
		}
	}
	return shareView;
}

-(void)startLoading:(UIView*)view withTitle:(NSString *)title{
    _loadLabel.text = title;
    [_indicatorView startAnimating];
    self.frame = view.bounds;
    [view addSubview:self];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (self.frame.size.height>460) {
            _midView.frame =CGRectMake(100, 190, 120, 100);
        }else{
            _midView.frame =CGRectMake(100, 140, 120, 100);
        }
        _indicatorView.frame = CGRectMake(150, _midView.origin.y+24, 20, 20);
        _loadLabel.frame = CGRectMake(110, _indicatorView.origin.y+_indicatorView.size.height+5, 100, 50);
    }else{
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        CGSize size = view.size;
        _midView.frame =CGRectMake((size.width-120)/2, size.height/2, 120, 100);
        _indicatorView.frame = CGRectMake((size.width-120)/2+50, _midView.origin.y+24, 20, 20);
        _loadLabel.frame = CGRectMake((size.width-120)/2+10, _indicatorView.origin.y+25, 100, 50);
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.8;
    animation.delegate = self;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_midView.layer addAnimation:animation forKey:nil];
}
- (void)removeLoading{
    [_indicatorView stopAnimating];
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
