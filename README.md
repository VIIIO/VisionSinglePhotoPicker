VisionSinglePhotoPicker
=====
* VisionSinglePhotoPicker provides a simplest way to get a SINGLE photo.
* 超方便的单张照片获取器。支持拍照/图库选择，已处理权限获取。

### Screenshots
![image](http://blog.viiio.com/wp-content/uploads/2016/04/visioncontrol_03.gif)

### Contents
## Installation 安装

* Just drag `VisionControl` folder into your project
* 将`VisionControl`文件夹拖入你的項目

### 在你需要使用控件的文件中导入头文件:
```objective-c
#import "VisionSinglePhotoPicker.h"
```
## Usage 使用方法
```objective-c
    VisionSinglePhotoPicker *picker = [[VisionSinglePhotoPicker alloc] initWithTarget:self];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {//判斷是不是Pad
        //是Pad必須指定sourceView
        [picker setPadPopoverSourceView:sourceView];
    }
    [picker show];
    
    
/*image picked
  在代理方法中处理已选择图片
*/
- (void)visionSinglePhotoPicker:(VisionSinglePhotoPicker *)picker pickedImage:(UIImage *)image;
```

## Features 特性
* support iPhone/iPad（You MUST set a SourceView on iPad via `- (void)setPadPopoverSourceView:(UIView *)sourceView`）</br>
* 支持iPhone/iPad（iPad必须设定SourceView：`- (void)setPadPopoverSourceView:(UIView *)sourceView`）</br>

## Requirements 要求
* iOS 8 or later. Requires ARC  ,support iPhone/iPad.
* iOS 8及以上系统可使用. 本控件纯ARC，支持iPhone/iPad横竖屏

## More 更多 

Please create a issue if you have any questions.
Welcome to visit my [Blog](http://blog.viiio.com/ "Vision的博客")

## Licenses
All source code is licensed under the [MIT License](https://github.com/VIIIO/VisionSinglePhotoPicker/blob/master/LICENSE "License").

