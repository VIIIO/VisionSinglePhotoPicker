//
//  VisionSinglePhotoPicker.m
//  VisionControls
//
//  Created by Vision on 16/3/16.
//  Copyright © 2016年 VIIIO. All rights reserved.
//

#import "VisionSinglePhotoPicker.h"

@interface VisionSinglePhotoPicker ()
@property (nonatomic, strong) UIAlertController *alert;
@property (nonatomic, strong) UIAlertController *actionSheet;


@end

@implementation VisionSinglePhotoPicker
{
    UIImagePickerControllerSourceType sourceType;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.alert = [UIAlertController alertControllerWithTitle:self.alertTitle message:self.alertMessage preferredStyle:UIAlertControllerStyleActionSheet];
        [self setUp];
    }
    return self;
}

- (instancetype)initWithTarget:(id)target{
    self = [super init];
    if (self) {
        self.delegate = target;
        self.alert = [UIAlertController alertControllerWithTitle:self.alertTitle message:self.alertMessage preferredStyle:UIAlertControllerStyleActionSheet];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.alertTitle = @"選取相片";
    self.alertMessage = @"需要提供訪問相機和相冊的權限";
    self.takePhotoText = @"拍照";
    self.viewPhotoLibraryText = @"從相冊選取";
    self.cancelText = @"取消";
}

- (void)show{
    UIAlertAction *act_cancel = [UIAlertAction actionWithTitle:self.cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    UIAlertAction *act_takePhoto = [UIAlertAction actionWithTitle:self.takePhotoText style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }else{
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        [self showPicker];
    }];
    UIAlertAction *act_browser = [UIAlertAction actionWithTitle:self.viewPhotoLibraryText style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self showPicker];
    }];
    [self.alert addAction:act_cancel];
    [self.alert addAction:act_takePhoto];
    [self.alert addAction:act_browser];
    [[self topMostController] presentViewController:self.alert animated:YES completion:nil];
}

- (void)showPicker{
    [self.alert dismissViewControllerAnimated:NO completion:nil];
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        imagePickerController.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }
    [[self topMostController] presentViewController:imagePickerController animated:YES completion:nil];
}

- (UIViewController*)topMostController{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}
#pragma mark - image picker delegte

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self.delegate visionSinglePhotoPicker:self pickedImage:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)setPadPopoverSourceView:(UIView *)sourceView{
    self.alert.popoverPresentationController.sourceView = sourceView.superview;
    self.alert.popoverPresentationController.sourceRect = sourceView.frame;
}
@end