//
//  CardDetailsViewController.h
//  iTotemMinFramework
//
//  Created by Alex.Liu on 2014-06-19.
//
//

#import <UIKit/UIKit.h>
#import "ITTImageView.h"

#import "ITTBaseDataRequest.h"
@interface CardDetailsViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,DataRequestDelegate,UIScrollViewDelegate>
{
    UIImage *fImage;
    UIImage *eImage;
    int isFront;
}

@property(nonatomic, strong) IBOutlet UILabel *cardTitle;
@property(nonatomic, strong) IBOutlet UILabel *cardBarCode;
@property(nonatomic, strong) IBOutlet UILabel *cardDes;
@property (nonatomic, strong ) IBOutlet UIButton *frontImage;
@property (nonatomic, strong ) IBOutlet UIButton *endImage;
@property (nonatomic, strong) IBOutlet ITTImageView *barcodeImage;
@property (nonatomic, strong ) IBOutlet UIButton *done;
@property (nonatomic, strong ) IBOutlet UIButton *generate;
@property (nonatomic, strong) IBOutlet UITextField *tftBarCode;
@property (nonatomic, strong) IBOutlet UITextField *tftTitle;
@property (nonatomic, strong) IBOutlet UITextField *tftDes;
@property (nonatomic, assign) BOOL isEditing;
@property (nonatomic, assign) BOOL newCard;
@property (nonatomic, strong) IBOutlet UIButton *postBtn;
@property (nonatomic, strong) IBOutlet UIScrollView *backScroll;

-(IBAction)frontCardOnClick:(id)sender;
-(IBAction)endCardOnClick:(id)sender;
-(IBAction)doneButtonOnclick:(id)sender;
-(IBAction)generateButtonOnclick:(id)sender;

@end
