//
//  DrawLineView.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawLineView.h"

@implementation DrawLineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"%s",__func__);
    //1.获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    //起点
    [path moveToPoint:CGPointMake(10, 10)];
    //终点
    [path addLineToPoint:CGPointMake(100, 100)];
    //设置颜色
    [[UIColor whiteColor]setStroke];
    //3.添加路径
    CGContextAddPath(contextRef, path.CGPath);
    //显示路径
    CGContextStrokePath(contextRef);
}


@end
