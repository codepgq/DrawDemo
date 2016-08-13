//
//  DrawRectView.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawRectView.h"

@implementation DrawRectView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1.获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 100, 100)];
    //设置颜色
    [[UIColor greenColor]set];
    //3.添加路径
    CGContextAddPath(contextRef, path.CGPath);
    //显示路径
    CGContextFillPath(contextRef);
    
}


- (void)drawRectWayOne{
    //1.获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    //起点
    [path moveToPoint:CGPointMake(10, 10)];
    //第二个点
    [path addLineToPoint:CGPointMake(100, 10)];
    //第三个点
    [path addLineToPoint:CGPointMake(100, 100)];
    //第四个点
    [path addLineToPoint:CGPointMake(10, 100)];
    //闭合路径 也等于 [path addLineToPoint:CGPointMake(10, 10)];
    [path closePath];
    //设置颜色
    [[UIColor greenColor]setStroke];
    //3.添加路径
    CGContextAddPath(contextRef, path.CGPath);
    //显示路径
    CGContextStrokePath(contextRef);

}

@end
