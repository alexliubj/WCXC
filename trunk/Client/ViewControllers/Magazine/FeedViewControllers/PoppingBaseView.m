//
//  PoppingBaseView.m
//
//  Created by Yan Guanyu on 5/29/12.
//  Copyright (c) 2012 iTotemStudio. All rights reserved.
//

#import "PoppingBaseView.h"

@interface PoppingBaseView(){
    UIControl *_bgControl;
}
@end

@implementation PoppingBaseView


+ (id)viewFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] objectAtIndex:0];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    _bgControl = [[UIControl alloc] init];
    _bgControl.backgroundColor = [UIColor blackColor];
    _bgControl.alpha = 0.5;
    [_bgControl addTarget:self action:@selector(onCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)show{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    _bgControl.frame = window.bounds;
    self.center = window.center;
    [window addSubview:_bgControl];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
        [self.layer addAnimation:[PoppingBaseView scaleAnimation:YES] forKey:@"POPPINGVIEWWILLAPPEAR"];
    } completion:^(BOOL finished){
        if (finished) {
            [self didShow];
        }
    }];
}

- (IBAction)onCancelBtn:(id)sender{
    [self willCancel:sender?YES:NO];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
        [self.layer addAnimation:[PoppingBaseView scaleAnimation:NO] forKey:@"POPPINGVIEWWILLDISAPPEAR"];
    } completion:^(BOOL finished){
        if (finished) {
            [self didCancel];
            [_bgControl removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}

- (void)cancel{
    [self onCancelBtn:nil];
}

#pragma mark - Subclass
- (void)didShow{}
- (void)willCancel:(BOOL)isAutoCancel{}
- (void)didCancel{};

#pragma mark - Animation
+ (CAKeyframeAnimation*)scaleAnimation:(BOOL)show{
    CAKeyframeAnimation *scaleAnimation = nil;
    scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.delegate = self;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    if (show){
        scaleAnimation.duration = 0.3;
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    }else{
        scaleAnimation.duration = 0.3;
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 1.0)]];
    }
    scaleAnimation.values = values;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.removedOnCompletion = TRUE;
    return scaleAnimation;
}

@end
