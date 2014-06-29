//
//  EdcationMessageAlertView.m
//  kunshanEducation
//
//  Created by admin on 13-1-29.
//
//

#import "EducationMessageAlertView.h"
@interface EducationMessageAlertView()
{
    
    IBOutlet UILabel *_messageLabel;
}
@end

@implementation EducationMessageAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (EducationMessageAlertView *)viewFromNibWithMessage:(NSString *)message
{
    EducationMessageAlertView *view = [super viewFromNib];
    [view show];
    [view setMessageLabeText:message];
    return view;
}

- (void)setMessageLabeText:(NSString *)messageText
{
    _messageLabel.text = messageText;
}

- (void)show
{
    [super show];
    self.top -= 48;
}

- (IBAction)onCancelBtnClicked:(id)sender
{
    [self cancel];
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
