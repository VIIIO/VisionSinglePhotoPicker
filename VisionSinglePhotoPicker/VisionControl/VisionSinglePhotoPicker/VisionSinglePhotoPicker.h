//
//  VisionSinglePhotoPicker.h
//  VisionControls
//
//  Created by Vision on 16/3/16.
//  Copyright © 2016年 VIIIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class VisionSinglePhotoPicker;
@protocol VisionSinglePhotoPickerDelegate <NSObject>

- (void)visionSinglePhotoPicker:(VisionSinglePhotoPicker *)picker pickedImage:(UIImage *)image;

@end
@interface VisionSinglePhotoPicker : NSObject<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, weak) id<VisionSinglePhotoPickerDelegate> delegate;
@property (nonatomic, copy) NSString *alertTitle;
@property (nonatomic, copy) NSString *alertMessage;
@property (nonatomic, copy) NSString *takePhotoText;
@property (nonatomic, copy) NSString *viewPhotoLibraryText;
@property (nonatomic, copy) NSString *cancelText;

- (void)show;
/** 如果是Pad，必須執行此方法來設定popover sourceView,否則會報錯. MUST CALL THIS METHOD on Pad to set popover sourceView or app will crash*/
- (void)setPadPopoverSourceView:(UIView *)sourceView;
- (instancetype)initWithTarget:(id)target;
@end
