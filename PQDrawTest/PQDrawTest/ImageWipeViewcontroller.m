//
//  ImageWipeViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ImageWipeViewcontroller.h"
#import "UIImage+PQImage.h"
@interface ImageWipeViewcontroller ()

@property (nonatomic,weak) UIImageView * wipeImageV;

@end

@implementation ImageWipeViewcontroller{
    CGPoint _statrPoint;
}

- (UIImageView *)wipeImageV{
    if (!_wipeImageV) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fore.jpg" ofType:nil]];
        imageView.image = image;
        [self.view addSubview:imageView];
        _wipeImageV = imageView;
    }
    return _wipeImageV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back.jpg" ofType:nil]];
    [self.view addSubview:imageView];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(wipePanGestureEvent:)];
    self.wipeImageV.userInteractionEnabled = YES;
    [self.wipeImageV addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)wipePanGestureEvent:(UIPanGestureRecognizer * )pan{
//    //计算位置
//    CGPoint nowPoint = [pan locationInView:self.wipeImageV];
//    CGFloat offsetX = nowPoint.x - 10;
//    CGFloat offsetY = nowPoint.y - 10;
//    CGRect clipRect = CGRectMake(offsetX, offsetY, 20, 20);
//    
//    //开启上下文
//    UIGraphicsBeginImageContextWithOptions(self.wipeImageV.bounds.size, NO, 1);
//    //获取当前的上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    //把图片绘制上去
//    [self.wipeImageV.layer renderInContext:ctx];
//    
//    //把这一块设置为透明
//    CGContextClearRect(ctx, clipRect);
//    
//    //获取新的图片
//    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    //关闭上下文
//    UIGraphicsEndImageContext();
//    
//    //重新赋值图片
//    self.wipeImageV.image = newImage;
    
    //封装后如下
    self.wipeImageV.image = [self.wipeImageV.image pq_wipeImageWithView:self.wipeImageV currentPoint:[pan locationInView:self.wipeImageV] size:CGSizeMake(40, 40)];
    
}


@end
