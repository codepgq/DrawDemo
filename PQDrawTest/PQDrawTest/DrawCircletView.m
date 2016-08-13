//
//  DrawCircletView.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawCircletView.h"

@implementation DrawCircletView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1、获取当前上下文
    CGContextRef  contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径 这是画椭圆的方法，大家都知道
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 100, 100)];
    //3.添加路径到上下文
    CGContextAddPath(contextRef, path.CGPath);
    //4.设置颜色
    [[UIColor redColor]setFill];
    //4.显示上下文
    CGContextFillPath(contextRef);
    
}

- (void)drawCircle{
    //1、获取当前上下文
    CGContextRef  contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
    //ArcCenter:中心点
    //radius:半径
    //startAngle：起始角度
    //endAngle：结束角度
    //clockwise：是否逆时针
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5) radius:self.bounds.size.width*0.4 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    //3.添加路径到上下文
    CGContextAddPath(contextRef, path.CGPath);
    //4.设置颜色
    [[UIColor brownColor]setFill];
    //4.显示上下文 显示一个实心圆
//    CGContextFillPath(contextRef);
    //显示一个空心圆，描边
    CGContextStrokePath(contextRef);
}

@end
