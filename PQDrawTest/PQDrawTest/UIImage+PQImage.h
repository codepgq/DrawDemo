//
//  UIImage+PQImage.h
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PQImage)
/**
 *  传入图片：xx.png xx.jpg
 *
 *  @param name
 *
 *  @return
 */
+ (nullable UIImage *)pq_drawImageWithImageNamed:(nullable NSString *)name;

/**
 *  添加图片水印
 *
 *  @param image
 *  @param waterImage
 *  @param rect
 *
 *  @return
 */
+ (nullable UIImage *)pq_WaterImageWithImage:(nullable UIImage *)image waterImage:(nullable UIImage *)waterImage waterImageRect:(CGRect)rect;
/**
 *  添加文字水印
 *
 *  @param image
 *  @param text
 *  @param point
 *  @param attributed
 *
 *  @return
 */
+ (nullable UIImage *)pq_WaterImageWithImage:(nullable UIImage *)image text:(nullable NSString *)text textPoint:(CGPoint)point attributedString:(nullable NSDictionary< NSString *, id> *)attributed;
/**
 *  裁剪圆形图片
 *
 *  @param image   <#image description#>
 *  @param rect    <#rect description#>
 *
 *  @return <#return value description#>
 */
+ (nullable UIImage *)pq_ClipCircleImageWithImage:(nullable UIImage *)image circleRect:(CGRect)rect;
/**
 *  裁剪圆形图片并设置边框大小和颜色
 *
 *  @param image       <#image description#>
 *  @param rect        <#rect description#>
 *  @param borderW     <#borderW description#>
 *  @param borderColor <#borderColor description#>
 *
 *  @return <#return value description#>
 */
+ (nullable UIImage *)pq_ClipCircleImageWithImage:(nullable UIImage *)image circleRect:(CGRect)rect borderWidth:(CGFloat)borderW borderColor:(nullable UIColor *)borderColor;

/**
 *  对View进行截屏
 *
 *  @param view
 */
+ (void)pq_cutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block;
/**
 *  对view的某一部分进行裁剪
 *
 *  @param view  <#view description#>
 *  @param frame <#frame description#>
 *  @param block <#block description#>
 */
+ (void)pq_cutScreenWithView:(nullable UIView *)view cutFrame:(CGRect)frame successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block;

/**
 *  传入一个ImageView，添加向下透明区域
 *
 *  @param view     <#view description#>
 *  @param nowPoint <#nowPoint description#>
 *  @param size     <#size description#>
 *
 *  @return <#return value description#>
 */
- (nullable UIImage *)pq_wipeImageWithView:(nullable UIView *)view currentPoint:(CGPoint)nowPoint size:(CGSize)size;
@end
