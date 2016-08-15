//
//  UIImage+PQImage.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "UIImage+PQImage.h"

@implementation UIImage (PQImage)

+ (UIImage *)pq_drawImageWithImageNamed:(NSString *)name{
    //1.获取图片
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
    //2.开启图形上下文
    UIGraphicsBeginImageContext(image.size);
    //3.绘制到图形上下文中
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //4.从上下文中获取图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

+ (UIImage *)pq_WaterImageWithImage:(UIImage *)image waterImage:(UIImage *)waterImage waterImageRect:(CGRect)rect{
    
    //1.获取图片
    
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //3.添加水印图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [waterImage drawInRect:rect];
    //4.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

+ (UIImage *)pq_WaterImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed{
    
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.添加水印图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [text drawAtPoint:point withAttributes:attributed];
    //3.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
    
}


+ (nullable UIImage *)pq_ClipCircleImageWithImage:(nullable UIImage *)image circleRect:(CGRect)rect{
    
    //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2、设置裁剪区域
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path addClip];
    
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5、关闭上下文
    UIGraphicsEndImageContext();
    
    //6、返回新图片
    return newImage;
}

+ (nullable UIImage *)pq_ClipCircleImageWithImage:(nullable UIImage *)image circleRect:(CGRect)rect borderWidth:(CGFloat)borderW borderColor:(nullable UIColor *)borderColor{
    //1、开启上下文
    UIGraphicsBeginImageContext(image.size);
    
    //获取当前上下文
    
    //2、设置裁剪区域
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [borderColor setFill];
    [path fill];
    
    UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.origin.x + borderW , rect.origin.x + borderW , rect.size.width - borderW * 2, rect.size.height - borderW *2)];
    [clipPath addClip];
    
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5、关闭上下文
    UIGraphicsEndImageContext();
    //6、返回新图片
    return newImage;
}

@end
