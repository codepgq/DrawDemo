//
//  UIImage+PQImage.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "UIImage+PQImage.h"
#import "PQWipeView.h"
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
    //3.绘制背景图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //绘制水印图片到当前上下文
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
    //2.绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //添加水印文字
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
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2、设置边框
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [borderColor setFill];
    [path fill];
    
    //3、设置裁剪区域
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

+ (void)pq_cutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block{
    //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    //2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3.截屏
    [view.layer renderInContext:ctx];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.转化成为Data
    //compressionQuality:表示压缩比 0 - 1的取值范围
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    //6、关闭上下文
    UIGraphicsEndImageContext();
    
    //7.回调
    block(newImage,data);
}

+ (void)pq_cutScreenWithView:(nullable UIView *)view cutFrame:(CGRect)frame successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block{
    
    //先把裁剪区域上面显示的层隐藏掉
    for (PQWipeView * wipe in view.subviews) {
        [wipe setHidden:YES];
    }
    
    
    // ************************   进行第一次裁剪 ********************
    
    //1.开启上下文
    UIGraphicsBeginImageContext(view.frame.size);
    //2、获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //3、添加裁剪区域
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:frame];
    [path addClip];
    //4、渲染
    [view.layer renderInContext:ctx];
    //5、从上下文中获取
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7、关闭上下文
    UIGraphicsEndImageContext();
    
    //8、进行完第一次裁剪之后，我们就已经拿到了没有半透明层的图片，这个时候可以恢复显示
    for (PQWipeView * wipe in view.subviews) {
        [wipe setHidden:NO];
    }
    
    // ************************   进行第二次裁剪 ********************
    //9、开启上下文，这个时候的大小就是我们最终要显示图片的大小
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
    
    //10、这里把x y 坐标向左、上移动
    [newImage drawAtPoint:CGPointMake(- frame.origin.x, - frame.origin.y)];
    
    //11、得到要显示区域的图片
    UIImage * fImage = UIGraphicsGetImageFromCurrentImageContext();
    //12、得到data类型 便于保存
    NSData * data2 = UIImageJPEGRepresentation(fImage, 1);
    //13、关闭上下文
    UIGraphicsEndImageContext();
    //14、回调
    block(fImage,data2);
}

- (nullable UIImage *)pq_wipeImageWithView:(nullable UIView *)view currentPoint:(CGPoint)nowPoint size:(CGSize)size{
    //计算位置
    CGFloat offsetX = nowPoint.x - size.width * 0.5;
    CGFloat offsetY = nowPoint.y - size.height * 0.5;
    CGRect clipRect = CGRectMake(offsetX, offsetY, size.width, size.height);
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    //获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //把图片绘制上去
    [view.layer renderInContext:ctx];
    
    //把这一块设置为透明
    CGContextClearRect(ctx, clipRect);
    
    //获取新的图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //重新赋值图片
    return newImage;
}

@end
