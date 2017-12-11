//
//  DrawTexttView.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawTexttView.h"

@implementation DrawTexttView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1.获取当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.创建文字
    NSString * str = @"纸巾艺术";
    //设置字体样式
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //NSFontAttributeName:字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    //字体前景色
    dict[NSForegroundColorAttributeName] = [UIColor blueColor];
    //字体背景色
    dict[NSBackgroundColorAttributeName] = [UIColor redColor];
    //字体阴影
    NSShadow * shadow = [[NSShadow alloc]init];
    //阴影偏移量
    shadow.shadowOffset = CGSizeMake(2, 2);
    //阴影颜色
    shadow.shadowColor = [UIColor greenColor];
    //高斯模糊
    shadow.shadowBlurRadius = 5;
    dict[NSShadowAttributeName] = shadow;
    //字体间距
    dict[NSKernAttributeName] = @10;
    //绘制到上下文
    //从某一点开始绘制 默认 0 0点
//    [str drawAtPoint:CGPointMake(100, 100) withAttributes:nil];
    //绘制区域设置
    [str drawInRect:rect withAttributes:dict];
    //添加到上下文
    CGContextStrokePath(contextRef);
}


@end
