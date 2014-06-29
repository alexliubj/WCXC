//
//  LoginViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *userName;
@property (nonatomic, strong) IBOutlet UITextField *userPassword;

-(IBAction)loginOnClick:(id)sender;
-(IBAction)registerOnClick:(id)sender;

@end
