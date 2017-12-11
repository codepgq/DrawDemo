//
//  DrawGradientController.m
//  PQDrawTest
//
//  Created by pgq on 2017/12/11.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "DrawGradientController.h"
#import "LineView.h"
@interface DrawGradientController ()

@end

@implementation DrawGradientController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //方案一：
    LineView * lineView = [[LineView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    lineView.center = self.view.center;
    [self.view addSubview:lineView];
    
    //方案二：
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
