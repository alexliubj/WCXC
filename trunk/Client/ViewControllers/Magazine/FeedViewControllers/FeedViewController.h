//
//  FeedViewController.h
//  kunshanEducation
//
//  Created by admin on 13-1-23.
//
//

#import <UIKit/UIKit.h>
#import "EducationMessageAlertView.h"
#import "ITTBaseDataRequest.h"


@interface FeedViewController : UIViewController<DataRequestDelegate>
{
    int _articleId;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
         andArticleId:(int)articleId;

-(IBAction)backAction:(id)sender;

@end
