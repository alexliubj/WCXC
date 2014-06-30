//
//  DEMOMenuViewController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOMenuViewController.h"
#import "CardMainViewController.h"
#import "DEMOSecondViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "MYPostViewController.h"
#import "MYPostViewController.h"
#import "LoginViewController.h"
#import "AboutViewController.h"
#import "UserProfileViewController.h"


@implementation DEMOMenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        imageView = [[ITTImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"jeff.png"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        imageView.delegate = self;
        [imageView setEnableTapEvent:YES];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"Jeff Li";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
}


#pragma mark - actionsheet delegate
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        
        NSUInteger sourceType = 0;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                    
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
    }
}


#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *fullPath = nil;
    
    [self saveImage:image withName:@"currentImage.png"];
    
    
    fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    profileImage = savedImage;
    [imageView setImage:savedImage];
    //  [self.imageView setImage:savedImage];
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:^{}];
}


//update user profile
- (void)imageViewDidClicked:(ITTImageView *)imageView
{
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    }
    else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 255;
    
    [sheet showInView:self.view];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
    label.text = @"我的";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if(DATA_ENV.userId == nil) // no logged in
    {
        
        if(indexPath.section == 0)
        {
            if(indexPath.row == 0) //login
            {
                [self login];
            }
            else //back to main page
            {
                [self gotoHomePage];
            }
        }
        else
        {
            [self aboutView];
            //about page
        }
    }
    else
    {
        if(indexPath.section == 0)
        {
            if(indexPath.row == 0) //homepage
            {
                [self gotoHomePage];
            }
            else if (indexPath.row == 1) //my adds
            {
                [self myAds];
            }
            else //my profile
            {
                [self myUserProfile];
            }
        }
        else
        {
            if(indexPath.row == 0) //about
            {
                [self aboutView];
            }
            else //logout
            {
                [self logout];
            }
        }
    }
    
    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if(DATA_ENV.userId == nil) // no logged in
    {
        if(sectionIndex == 0)
        {
            return 2;
        }
        else
        {
            return 1;
        }
    }
    else
    {
        if(sectionIndex == 0)
        {
            return 3;
        }
        else
        {
            return 2;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(DATA_ENV.userId == nil) // no logged in
    {
        if (indexPath.section == 0) {
            NSArray *titles = @[@"登陆", @"回主页"];
            cell.textLabel.text = titles[indexPath.row];
        } else {
            NSArray *titles = @[@"关于"];
            cell.textLabel.text = titles[indexPath.row];
        }
    }
    else // logged in
    {
        if (indexPath.section == 0) {
            NSArray *titles = @[@"回主页", @"我的广告", @"我的资料"];
            cell.textLabel.text = titles[indexPath.row];
        } else {
            NSArray *titles = @[@"关于", @"登出"];
            cell.textLabel.text = titles[indexPath.row];
        }
    }
    return cell;
}

-(void)gotoHomePage
{
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    CardMainViewController *homeViewController = [[CardMainViewController alloc] init];
    navigationController.viewControllers = @[homeViewController];
}


-(void)myAds
{
    MYPostViewController *myAds = [[ MYPostViewController alloc] initWithNibName:@"MYPostViewController" bundle:nil];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;

    navigationController.viewControllers = @[myAds];
}

-(void)myUserProfile
{
    UserProfileViewController *updateProfile = [[ UserProfileViewController alloc] initWithNibName:@"UserProfileViewController" bundle:nil];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    navigationController.viewControllers = @[updateProfile];
}
-(void)aboutView
{
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;

    AboutViewController *aboutViewController = [[ AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    navigationController.viewControllers = @[aboutViewController];

}

-(void)login
{
    LoginViewController *loginViewController = [[ LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];

    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    
    navigationController.viewControllers = @[loginViewController];
}
-(void)logout
{
    DATA_ENV.userId = nil;
    DATA_ENV.userName = nil;
    [self.tableView reloadData];
}
@end
