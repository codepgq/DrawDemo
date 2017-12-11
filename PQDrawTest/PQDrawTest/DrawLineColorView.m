//
//  DrawLineColorView.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawLineColorView.h"

@implementation DrawLineColorView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [[self bezierPathWithPoint:CGPointMake(10, 10) endPoint:CGPointMake(10, 180) lineColor:[UIColor purpleColor] lineWidth:6] stroke];
    [[self bezierPathWithPoint:CGPointMake(50, 10) endPoint:CGPointMake(50, 180) lineColor:[UIColor greenColor] lineWidth:6] stroke];
    [[self bezierPathWithPoint:CGPointMake(90, 10) endPoint:CGPointMake(90, 180) lineColor:[UIColor orangeColor] lineWidth:6] stroke];
    
}

- (UIBezierPath *)bezierPathWithPoint:(CGPoint)startPoint endPoint:(CGPoint) endPoint lineColor:(UIColor*)lineColor lineWidth:(CGFloat)lineWidth{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [lineColor setStroke];
    path.lineWidth = lineWidth;
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    
    return path;
}

- (void)oneWay{
    //1 获取上下文
    //分别设置线段的颜色
    CGContextRef purple = UIGraphicsGetCurrentContext();
    [[UIColor purpleColor]setStroke];
    CGContextSaveGState(purple);
    
    CGContextRef orange = UIGraphicsGetCurrentContext();
    [[UIColor orangeColor]setStroke];
    CGContextSaveGState(orange);
    
    CGContextRef green = UIGraphicsGetCurrentContext();
    [[UIColor greenColor]setStroke];
    CGContextSaveGState(green);
    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 5;
    
    //把紫色的上下文从栈中取出来
    CGContextRestoreGState(purple);
    //第一条线
    [[UIColor purpleColor]setStroke];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(10, 100)];
    [path stroke];
    
    
    //把紫色的上下文从栈中取出来
    CGContextRestoreGState(orange);
    path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 9;
    //第二条线
    [[UIColor orangeColor]setStroke];
    [path moveToPoint:CGPointMake(30, 10)];
    [path addLineToPoint:CGPointMake(30, 100)];
    [path stroke];
    
    //把紫色的上下文从栈中取出来
    CGContextRestoreGState(green);
    path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 3;
    //第三条线
    [[UIColor greenColor]setStroke];
    [path moveToPoint:CGPointMake(50, 10)];
    [path addLineToPoint:CGPointMake(50, 100)];
    [path stroke];

}

@end
