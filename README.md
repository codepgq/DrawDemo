#背景：
> 某天，你正在上班ing……这个时候老大过来了，“小王啊，这个按钮太丑了，客户要求变成五角星形状的，UI没空给你切图，你给我完成这个需求啊”，说完便头也不回的走了，留下你一个人在冷风中摇曳，心里一万只草泥马在狂奔……

![1.png](http://upload-images.jianshu.io/upload_images/1940927-9bdb1a3720f98cab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> OK OK ,自己选的IOS开发，哭着也要完成…… 这里你可能就需要使用绘图这一块的知识了。如果你恰好这块还是比较空白的，那么就是。。。
![2.gif](http://upload-images.jianshu.io/upload_images/1940927-a60cbbd207607d6e.gif?imageMogr2/auto-orient/strip)

.
.
.
 >没关系，先让我们重drawRect，这个方法开始吧。
首先了解一下这个东西干嘛的，怎么用，啥时候用。
- 1 干嘛的：如果你要对View进行绘制，那么你就要到这里处理
- 2 怎么用：那当然是在这里涂鸦
- 3 啥时候用：代码说明一切
```
-[DrawLineViewcontroller loadView]
-[DrawLineViewcontroller viewDidLoad]
-[DrawLineViewcontroller viewWillAppear:]
-[DrawLineView drawRect:]
-[DrawLineViewcontroller viewDidAppear:]
```
从上述代码我们看到他是在视图将要显示之后和显示之前调用的。

.
.
.
通常我们需要进行一下的步骤进行绘制。
> - 1 获取当前的上下文（这里只能获取一次，并且只能在drawRect方法中获取）
- 2 描述路径、形状（就是处理想要显示的样子）
- 3 把描述好的路径、形状添加早上下文中
- 4 显示上下文内容

.
.
.
> ### 1 画线
 - 第一步：先创建一个工程
 - 第二步：创建一个View的子类，因为要重写drawRect方法
 - 第三步：重写DrawRect
 - 第四步：先了解一下线段是如何绘制的，额……两个点确定一条直线，这些东西大家都懂，所以我们需要一个起点和一个终点来确定一条直线。
![3.png](http://upload-images.jianshu.io/upload_images/1940927-aac1f3d8fea57a7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###代码如下：
```
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
```
![4.png](http://upload-images.jianshu.io/upload_images/1940927-fcb288e8749a0227.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
额外属性：CGContextSetLineWidth(contextRef, 5); //设置线宽

.
.
.
> ### 1 画矩形
 - 第一步：先创建一个工程
 - 第二步：创建一个View的子类，因为要重写drawRect方法
 - 第三步：重写DrawRect
 - 第四步：先了解一下矩形是如何绘制的，矩形是由四个边组成，所以我们画四条线段便可以画一个矩形。
![5.png](http://upload-images.jianshu.io/upload_images/1940927-9bbb5bf35d266373.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

方法一：
```
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
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
```
效果图
![方法一](http://upload-images.jianshu.io/upload_images/1940927-3071c77b4dd8bb25.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

方法二：通过一个起点和宽高，可计算出来矩形的大小位置
```
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
```
效果图：
![方法二](http://upload-images.jianshu.io/upload_images/1940927-bf701f6718a690b5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 画矩形总结：stroke：描边 、 fill：填充
> //设置描边颜色
    [[UIColor greenColor]setStroke];
//显示描边路径
    CGContextStrokePath(contextRef);
//设置填充颜色
    [[UIColor greenColor]set];
//显示填充路径
    CGContextFillPath(contextRef);

.
.
.
> ### 3 画圆
 - 第一步：先创建一个工程
 - 第二步：创建一个View的子类，因为要重写drawRect方法
 - 第三步：重写DrawRect
 - 第四步：先了解一下圆形是如何绘制的，要确定圆心、半径，以及旋转的角度。
![圆](http://upload-images.jianshu.io/upload_images/1940927-3af998b2f2567519.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

方法一：
```
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
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
```
效果图：
![效果图](http://upload-images.jianshu.io/upload_images/1940927-068c2341f1d2b35d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

方法二：通过话椭圆的方式去画圆，大家都知道圆就是椭圆的一个特殊存在。宽高一致的时候就是圆形。
```
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
```

![效果图](http://upload-images.jianshu.io/upload_images/1940927-08a123ea1baf0829.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

.
.
.
> ### 4 画文字
 - 第一步：先创建一个工程
 - 第二步：创建一个View的子类，因为要重写drawRect方法
 - 第三步：重写DrawRect
 - 第四步：写一段文字，把文字绘制到上下文中

```
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1.获取当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.创建文字
    NSString * str = @"纸巾艺术";
    //会知道上下文
    [str drawInRect:rect withAttributes:nil];
    CGContextStrokePath(contextRef);
}
```

![基本版效果图](http://upload-images.jianshu.io/upload_images/1940927-dd602dfc189cb61a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

复杂版：
```
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
```
![复杂版效果图](http://upload-images.jianshu.io/upload_images/1940927-a1420eabb801ca97.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

.
.
.
> ### 5 画图片
 - 第一步：先创建一个工程
 - 第二步：创建一个View的子类，因为要重写drawRect方法
 - 第三步：重写DrawRect
 - 第四步：加载一张图片，绘制到上下文中

```
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
```
![都写一起了！！！](http://upload-images.jianshu.io/upload_images/1940927-c4b0966988c7afc0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


.
.
.
.
.
> ### 6 综合实例：
 > > #### 1 重绘 
实现一个下载进度条
 - 第一步：先创建一个工程
 - 第二步：创建一个View的子类，因为要重写drawRect方法
 - 第三步：重写DrawRect
 - 第四步：加载一张图片，绘制到上下文中

```
- (void)drawRect:(CGRect)rect {
    
    CGFloat startA = - M_PI_2;
    CGFloat endA =  - M_PI_2 + self.progress * M_PI * 2;
    NSLog(@"%f - %f - %f",self.progress,(3.14159265359*self.progress)/180,endA);
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5) radius:self.bounds.size.width*0.5-10 startAngle:startA endAngle:endA clockwise:YES];
    [path stroke];
    
}
```
这里我们可以看到我并没有获取当前的上下文，这里是因为[path stroke]; 已经帮我们完成了其余的操作。
其实内部实现还是一样的！！
基本版效果：
![基本版效果](http://upload-images.jianshu.io/upload_images/1940927-0efb7b4bf573ca67.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
高能版：上面的只是完成了功能，但是却不好看！！然后我们稍稍的美化一下

```
- (void)drawRect:(CGRect)rect {
    
    CGFloat startA = - M_PI_2;
    CGFloat endA =  - M_PI_2 + self.progress * M_PI * 2;
    NSLog(@"%f - %f - %f",self.progress,(3.14159265359*self.progress)/180,endA);
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5) radius:self.bounds.size.width*0.5-10 startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor colorWithRed:self.progress green:(1-self.progress) blue:0 alpha:1]setStroke];
    path.lineWidth = 5;
    [path stroke];
    
}
```

![动画版](http://upload-images.jianshu.io/upload_images/1940927-9849444675aa76a8.gif?imageMogr2/auto-orient/strip)
.
.
.
.
.
 > > #### 2 不同颜色的线
先跑出问题！
![线](http://upload-images.jianshu.io/upload_images/1940927-76fcf91d042252ba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这种线怎么处理！我们先实现三条线

```
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    //设置线宽
    path.lineWidth = 5;
    
    //第一条线
    [[UIColor purpleColor]setStroke];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(10, 100)];
    
    //第二条线
    [[UIColor orangeColor]setStroke];
    [path moveToPoint:CGPointMake(30, 10)];
    [path addLineToPoint:CGPointMake(30, 100)];
    
    //第三条线
    [[UIColor greenColor]setStroke];
    [path moveToPoint:CGPointMake(50, 10)];
    [path addLineToPoint:CGPointMake(50, 100)];
    
    //使用描边方式添加到上下文中
    [path stroke];
}
```
你可能想当然的就这么做了，可是你发现效果是这样子的！！！
![哎呀我去，为什么](http://upload-images.jianshu.io/upload_images/1940927-b1a121e0bb6b58de.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
其实是这样子的

![先设置了紫色](http://upload-images.jianshu.io/upload_images/1940927-2a528d99a2743299.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![设置了橙色](http://upload-images.jianshu.io/upload_images/1940927-42068017dfefc6f9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![设置了绿色](http://upload-images.jianshu.io/upload_images/1940927-b23809a65d019604.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

所以，最后显示的就是绿色！！！！

这里我们还要了解一个东西！
上下文的状态栈。

![21.png](http://upload-images.jianshu.io/upload_images/1940927-3b92a7f68bff61ab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


方法一：
```
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
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
```
方法二：

```
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
```

![了解了原理之后就这样子写快点啦 ](http://upload-images.jianshu.io/upload_images/1940927-f6101934d8627660.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

<br>
2017年12月11日
####新增渐变色的绘制：方案一使用CGContextDrawLinearGradient去做


<br>
新建一个View在Controller中加载他，然后实现如下代码，注释比较详细，就不在说明了。
```
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
```
<br>
<br>
#### 方案二使用CAGradientLayer去做
```
    CAGradientLayer * layer = [CAGradientLayer layer];
    //设置大小
    layer.frame = CGRectMake(0, 400, 300, 3);
    //设置颜色
    layer.colors = @[(__bridge id)[UIColor colorWithRed:204.0 / 255.0 green:224.0 / 255.0 blue:244.0 / 255.0 alpha:1].CGColor,
                        (__bridge id)[UIColor colorWithRed:29.0 / 255.0 green:156.0 / 255.0 blue:215.0 / 255.0 alpha:1].CGColor,
                        (__bridge id)[UIColor colorWithRed:0.0 / 255.0 green:50.0 / 255.0 blue:126.0 / 255.0 alpha:1].CGColor];
    //渐变层的相对位置,起始点为0,终止点为1,中间点为 (point-startpoint)/(endpoint-startpoint)
    layer.locations = @[@0,@.5,@1];
    //渐变方向
    layer.startPoint = CGPointMake(0, 1);
    layer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:layer];
```
![最终效果](http://upload-images.jianshu.io/upload_images/1940927-e8524a83c2907b7d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



<br>
## [demo地址](https://github.com/codepgq/DrawDemo)
####下一篇：[图形上下文](http://www.jianshu.com/p/4e22c6ac114d)
