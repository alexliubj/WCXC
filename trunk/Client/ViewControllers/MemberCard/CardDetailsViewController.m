//
//  CardDetailsViewController.m
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import "CardDetailsViewController.h"
#import "AppDelegate.h"
#import "HomeTabBarController.h"
#import "CardModel.h"
#import "ITTCommonFunctions.h"
#import "ITTGobalPaths.h"
#import "ITTCommonMacros.h"
#import "ITTAdditions.h"
#import "AFJSONRequestOperation.h"
#import "DemoDataRequest.h"

@interface CardDetailsViewController ()
{
    BOOL isFullScreen;

}
@end

@implementation CardDetailsViewController


-(IBAction)frontCardOnClick:(id)sender
{
    isFront = 0;
    [self chooseImage:0];
}
-(IBAction)endCardOnClick:(id)sender
{
    isFront = 1;
    [self chooseImage:1];
}
-(IBAction)doneButtonOnclick:(id)sender
{
}
-(IBAction)generateButtonOnclick:(id)sender
{
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

// It is important for you to hide kwyboard

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AppDelegate GetAppDelegate].tabBarController.tabBarHidden = TRUE;

}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(!isChooseImage)
    [AppDelegate GetAppDelegate].tabBarController.tabBarHidden = FALSE;
    else
    {
        [AppDelegate GetAppDelegate].tabBarController.tabBarHidden = TRUE;
    }

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _newCard = YES;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
         andCardModel:(CardModel *)cardModel
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _cardModel = cardModel;
    }
    return self;
}


-(void)CreateNewCard
{
    NSDictionary *params = @{@"cardType":@"1",
                             @"cardTitle":@"CardTitle",
                             @"cardBarcode":@"3434342",
                             @"cardNumber":@"123123123",
                             @"cardDes":@"好卡",
                             @"memberID":@"123123",
                             @"uploaded1":fImage,
                             @"uploaded2":eImage};
    [CreateNewCardRequest requestWithParameters:params withIndicatorView:nil withCancelSubject:nil onRequestFinished:^(ITTBaseDataRequest *request){
        ITTDINFO(@"block success!");
    }];
}
-(void)UpdateACard
{
    NSDictionary *params = @{@"cardID":@"5",
                             @"cardTitle":@"cardUpload444444",
                             @"cardBarcode":@"444444444",
                             @"cardNumber":@"4444444444",
                             @"cardDes":@"好卡",
                             @"uploaded1":fImage,
                             @"uploaded2":eImage};
    [UpdateCardRequest requestWithParameters:params withIndicatorView:nil withCancelSubject:nil onRequestFinished:^(ITTBaseDataRequest *request){
        ITTDINFO(@"block success!");
    }];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!_newCard) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self
                                                                                 action:@selector(editNewCard)];
    }
   
    // Do any additional setup after loading the view from its nib.
    
    [_backScroll setContentSize:CGSizeMake(320, 650)];
    if(_newCard)
    self.title = @"添加卡片";
    else
    {
        self.title = @"我的卡片";
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
	[picker dismissViewControllerAnimated:YES completion:^{
        isChooseImage = NO;
    }];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *fullPath = nil;
    
    if(isFront == 0)
    {
    [self saveImage:image withName:@"currentImage.png"];
    
        
    fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    }
    else
    {
        [self saveImage:image withName:@"currentImage1.png"];
        
        
        fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage1.png"];
    }
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    if(isFront == 0)
    {
        fImage = savedImage;
    [self.frontImageView setImage:savedImage];
    }
    
    else
    {
        eImage = savedImage;
        [self.endImageView setImage:savedImage];

    }
    isFullScreen = NO;
    
    
  //  [self.imageView setImage:savedImage];
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:^{
        isChooseImage = NO;
    }];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
//    isFullScreen = !isFullScreen;
//    UITouch *touch = [touches anyObject];
//    
//    CGPoint touchPoint = [touch locationInView:self.view];
//    
//    CGPoint imagePoint = self.imageView.frame.origin;
//    //touchPoint.x ，touchPoint.y 就是触点的坐标
//    
//    // 触点在imageView内，点击imageView时 放大,再次点击时缩小
//    if(imagePoint.x <= touchPoint.x && imagePoint.x +self.imageView.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+self.imageView.frame.size.height >= touchPoint.y)
//    {
//        // 设置图片放大动画
//        [UIView beginAnimations:nil context:nil];
//        // 动画时间
//        [UIView setAnimationDuration:1];
//        
//        if (isFullScreen) {
//            // 放大尺寸
//            
//            self.imageView.frame = CGRectMake(0, 0, 320, 480);
//        }
//        else {
//            // 缩小尺寸
//            self.imageView.frame = CGRectMake(50, 65, 90, 115);
//        }
//        
//        // commit动画
//        [UIView commitAnimations];
//        
//    }
    
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
        isChooseImage = YES;

        [self presentViewController:imagePickerController animated:YES completion:^{
        }];
        
    }
}
- (IBAction)chooseImage:(int)fronOrEnd{
    
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

-(void)initControlsWithData
{
    
}

-(void)editNewCard
{
  //  [self UpdateACard];
    
    if(!_isEditing)
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self
                                                                                 action:@selector(editNewCard)];
        [self setEditingMode];
    }
    else
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self
                                                                                 action:@selector(editNewCard)];
        [self cancleEditingMode];
        [self initControlsWithData];
    }
    
    _isEditing = !_isEditing;
}

-(void)setEditingMode
{
    _frontImage.hidden= NO;
    _endImage.hidden = NO;
    _generate.hidden = NO;
    _postBtn.hidden = NO;
    _done.hidden = NO;
    [_tftBarCode setEnabled:YES];
    [_tftTitle setEnabled:YES];
    [_tftDes setEnabled:YES];
    
}

-(void)cancleEditingMode
{
    _frontImage.hidden= YES;
    _endImage.hidden = YES;
    _generate.hidden = YES;
    _postBtn.hidden = YES;
    _done.hidden = YES;
    [_tftBarCode setEnabled:NO];
    [_tftTitle setEnabled:NO];
    [_tftDes setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
