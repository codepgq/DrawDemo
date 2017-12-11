//
//  ImageAddWaterImageViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ImageAddWaterImageViewcontroller.h"
#import "UIImage+PQImage.h"
@interface ImageAddWaterImageViewcontroller ()

@end

@implementation ImageAddWaterImageViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageView.image = [UIImage pq_WaterImageWithImage:[UIImage imageNamed:@"222"] waterImage:[UIImage imageNamed:@"222"] waterImageRect:CGRectMake(30, 30, 50, 50)];
    [self.view addSubview:imageView];
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
