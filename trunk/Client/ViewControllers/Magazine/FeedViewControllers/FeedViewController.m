//
//  FeedViewController.m
//  kunshanEducation
//
//  Created by admin on 13-1-23.
//
//

#import "FeedViewController.h"
#import "DemoDataRequest.h"
#import "WaitingDailogView.h"
#import "ITTDataRequest.h"


@interface FeedViewController (){

    IBOutlet UITextField *_contactTextField;
    IBOutlet UILabel *_contentMessageLabel;
    IBOutlet UITextView *_contentTextView;
    IBOutlet UIView *_contactTextFieldBgView;
}

@end

@implementation FeedViewController


#pragma mark DataRequestDelegate
- (void)requestDidFinishLoad:(ITTBaseDataRequest*)request {
    
    [[WaitingDailogView shareView] removeLoading];
    
//    if ([request isKindOfClass: [PostComments class]]){
//        
//        if ([[request.resultDic objectForKey:@"result"] isEqualToString:@"succ"]) {
//
//            [EducationMessageAlertView viewFromNibWithMessage:@"反馈成功"];
//            [self.navigationController popViewControllerAnimated:YES];
//        }
//        else
//        {
//            [EducationMessageAlertView viewFromNibWithMessage:@"反馈失败"];
//
//        }
//    }
}


-(void)requestDidStartLoad:(ITTBaseDataRequest *)request
{
    [[WaitingDailogView shareView] startLoading:self.view withTitle:@"Loading..."];
}

- (void)requestDidCancelLoad:(ITTBaseDataRequest*)request
{
    [[WaitingDailogView shareView] removeLoading];
}
- (void)request:(ITTBaseDataRequest*)request progressChanged:(float)progress
{
}
- (void)request:(ITTBaseDataRequest*)request didFailLoadWithError:(NSError*)error
{
    [[WaitingDailogView shareView] removeLoading];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
         andArticleId:(int)articleId
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _articleId = articleId;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DATA_ENV.userId = @"1";
    
    _contentTextView.layer.borderWidth = 0.5f;
    _contentTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _contentTextView.layer.cornerRadius = 3;
    
    _contactTextFieldBgView.layer.borderWidth = 0.5f;
    _contactTextFieldBgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _contactTextFieldBgView.layer.cornerRadius = 3;
    [_contentTextView becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(postCmt)];
}

-(void)postCmt
{
        NSDictionary *params = @{@"articleID": [NSString stringWithFormat:@"%d",_articleId],
                                 @"memberID":DATA_ENV.userId,
                                 @"commentContent": _contentTextView.text};
        [PostACommentRequest requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"PostACommentRequest" onRequestFinished:^(ITTBaseDataRequest *request){
            
            ITTDINFO(@"request successed");
            
        }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    _contactTextField = nil;
    _contentTextView = nil;
    _contactTextFieldBgView = nil;
    _contentMessageLabel = nil;
    [super viewDidUnload];
}


-(void)postComments
{
//    [PostComments requestWithDelegate:self withParameters:[NSDictionary dictionaryWithObjectsAndKeys:_contentTextView.text,@"comments",_contactTextField.text,@"email", nil]];
}

-(IBAction)backAction:(id)sender
{
    [_contentTextView resignFirstResponder];
    [_contactTextField resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSendBtnClicked:(id)sender
{
    [_contentTextView resignFirstResponder];
    [_contactTextField resignFirstResponder];
    if (_contentTextView.text.length > 0) {
        [self postComments];
        
    }else{
      
         [EducationMessageAlertView viewFromNibWithMessage:@"输入的内容不能为空！"];
    }
}

// rotation support for iOS 5.x and earlier, note for iOS 6.0 and later this will not be called
//
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#endif

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text length] == 0) {
        _contentMessageLabel.hidden = NO;
    }
}
- (void)textViewDidChange:(UITextView *)textView
{
    _contentMessageLabel.hidden = YES;
}
@end
