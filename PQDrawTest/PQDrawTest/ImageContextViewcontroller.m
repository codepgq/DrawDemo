//
//  ImageContextViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ImageContextViewcontroller.h"
#import "UIImage+PQImage.h"
@interface ImageContextViewcontroller ()

@end

@implementation ImageContextViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageView.image = [UIImage pq_drawImageWithImageNamed:@"222.png"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
