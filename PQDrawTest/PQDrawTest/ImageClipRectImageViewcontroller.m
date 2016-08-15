//
//  ImageClipRectImageViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ImageClipRectImageViewcontroller.h"
#import "PQClipView.h"
#import "UIImage+PQImage.h"
#import "UIView+pgqViewExtension.h"
@interface ImageClipRectImageViewcontroller ()

@property (nonatomic,strong) PQClipView * clipView;
@property (nonatomic,strong) UIImageView * imgView;

@end

@implementation ImageClipRectImageViewcontroller{
    UIImage *_image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    //添加一个右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定裁剪" style:UIBarButtonItemStylePlain target:self action:@selector(cutFinish)];
    
    _image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back.jpg" ofType:nil]];
    //添加一个背景图片
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    imgView.image = _image;
    [self.view addSubview:imgView];
    self.imgView = imgView;
    
    _clipView = [[[NSBundle mainBundle]loadNibNamed:@"PQClipView" owner:self options:nil] firstObject];
    [self.view addSubview:_clipView];
    
}

- (void)cutFinish{
    
//    [UIImage pq_cutScreenWithView:self.imgView cutFrame:self.clipView.frame successBlock:^(UIImage * _Nullable image, NSData * _Nullable imagedata) {
//        if (image) {
//            NSLog(@"截取成功");
//            NSString * path = [NSString stringWithFormat:@"%@/Documents/cutSome.jpg",NSHomeDirectory()];
//            
//            if( [imagedata writeToFile:path atomically:YES]){
//                NSLog(@"保存成功%@",path);
//            }
//            
//        }
//    }];
    
    NSLog(@"%@",NSStringFromCGSize(self.clipView.size));
    
    UIGraphicsBeginImageContext(self.clipView.size);
    
    CGPoint point = [self.clipView convertPoint:self.clipView.frame.origin fromView:self.imgView];
    
    CGRect rect = CGRectMake(self.clipView.x, self.clipView.y-64, self.clipView.width, self.clipView.height+128);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClipToRect(ctx, rect);
    
    [self.imgView.layer renderInContext:ctx];
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData * data = UIImagePNGRepresentation(newImage);
    
    NSString * path = [NSString stringWithFormat:@"%@/Documents/cutSome.png",NSHomeDirectory()];
    if( [data writeToFile:path atomically:YES]){
        NSLog(@"保存成功%@",path);
    }
    UIGraphicsEndImageContext();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
