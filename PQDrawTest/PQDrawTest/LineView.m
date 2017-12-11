//
//  LineView.m
//  DrawLineDemo
//
//  Created by pgq on 2017/12/11.
//  Copyright © 2017年 pgq. All rights reserved.
//

#import "LineView.h"

@implementation LineView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    //画线
    [self drawLine];
    
    //画一个渐变色的线
    [self drawLineWithStartColor:[UIColor redColor] endColor:[UIColor greenColor]];
}

- (void)drawLineWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor{
    //1、获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3、创建一个颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //4、设置颜色的location
    CGFloat locations[] = { 0.0, 1.0 };
    //5、创建一个颜色数组，由于NSArray里面只能存对象，所以需要桥接
    NSArray *colors = @[(__bridge id)startColor.CGColor,(__bridge id)endColor.CGColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    //释放
    CFRelease(colorSpace);
    
    //保存一份当前上下文，压栈
    CGContextSaveGState(ctx);
    
    //绘制一个矩形，矩形足够小，也可以是一条线
    CGFloat width = self.frame.size.width;
    CGContextMoveToPoint(ctx, 0, 120);
    CGContextAddLineToPoint(ctx, width, 120);
    CGContextAddLineToPoint(ctx, width, 123);
    CGContextAddLineToPoint(ctx, 0, 123);
    //裁剪
    CGContextEOClip(ctx);
    
    //绘制渐变
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 100), CGPointMake(self.frame.size.width, 100), kCGGradientDrawsBeforeStartLocation);
    
    //恢复一份当前的上下文，出栈
    CGContextRestoreGState(ctx);
    
    //释放内存
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
}

- (void)drawLine{
    //1、获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2画一条直线的需要知道的就是两个点，也就是起点和终点
    //2.1、选择一个点最为画线的起点
    CGContextMoveToPoint(ctx, 0, 100);
    //2.2、设置线的终点
    CGContextAddLineToPoint(ctx, 300, 100);
    
    CGContextSetLineWidth(ctx, 3);
    
    //3、填充路径 填充路径的方法有两个 一个是 stroke(描边) 一个 fill(填充)
    CGContextStrokePath(ctx);// 类似于描边
    
    //4、释放内存
    CGContextRelease(ctx);
}


@end
