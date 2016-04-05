//
//  ViewController.m
//  VisionSinglePhotoPicker
//
//  Created by Vision on 16/4/5.
//  Copyright © 2016年 VIIIO. All rights reserved.
//

#import "ViewController.h"
#import "VisionSinglePhotoPicker.h"

@interface ViewController ()<VisionSinglePhotoPickerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPicker:(id)sender {
    VisionSinglePhotoPicker *picker = [[VisionSinglePhotoPicker alloc] initWithTarget:self];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {//判斷是不是Pad
        //是Pad必須指定sourceView
        [picker setPadPopoverSourceView:sender];
    }
    [picker show];
}

#pragma mark - visionControl delegates
#pragma mark visionSinglePhotoPickerDelegate
- (void)visionSinglePhotoPicker:(VisionSinglePhotoPicker *)picker pickedImage:(UIImage *)image{
    self.imgv.image = image;
}
@end
