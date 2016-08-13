//
//  DrawImageView.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawImageView.h"

@implementation DrawImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1.获取当前的上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.加载图片
    //这里顺便咯嗦一句：使用imageNamed加载图片是会有缓存的
    //我们这里只需要加载一次就够了，不需要多次加载，所以不应该保存这个缓存
//    UIImage * image = [UIImage imageNamed:@"222"]; //所以可以换一种方式去加载
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"222.png" ofType:nil]];
    
    
//    //绘制的大小位置
//    [image drawInRect:rect];
    
    
//    //从某个点开始绘制
//    [image drawAtPoint:CGPointMake(0, 0)];
    
    
    //绘制一个多大的图片，并且设置他的混合模式以及透明度
    //Rect：大小位置
    //blendModel：混合模式
    //alpha：透明度
    [image drawInRect:rect blendMode:kCGBlendModeNormal alpha:1];
    
    
    //从某一点开始绘制图片，并设置混合模式以及透明度
    //point:开始位置
    //blendModel：混合模式
    //alpha：透明度
//    [image drawAtPoint:CGPointMake(0, 0) blendMode:kCGBlendModeNormal alpha:1];
    
    //添加到上下文
    CGContextFillPath(contextRef);
}


@end
