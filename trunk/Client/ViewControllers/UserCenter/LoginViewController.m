//
//  LoginViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "DemoDataRequest.h"
#import "UserModel.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)loginOnClick:(id)sender
{
    NSDictionary *params = @{@"email": _userName.text,
                             @"password":_userPassword.text};
    [LoginRequest requestWithParameters:params withIndicatorView:self.view withCancelSubject:@"LoginRequest" onRequestFinished:^(ITTBaseDataRequest *request){
        
        [userArray removeAllObjects];
        [userArray addObjectsFromArray:request.handleredResult[@"cardList"]];
        
        if(userArray.count >0)
        {
            UserModel *model= [[UserModel alloc] init];
            model = [userArray objectAtIndex:0];
            DATA_ENV.userId = model.memberID;
            DATA_ENV.userName = model.accountName;
        }
    }];
}
-(IBAction)registerOnClick:(id)sender
{
    RegisterViewController *reg = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:reg animated:YES];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"登陆";
    userArray = [[NSMutableArray alloc ] initWithCapacity:2];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
