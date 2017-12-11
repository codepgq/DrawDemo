//
//  DrawImageViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawImageViewcontroller.h"
#import "DrawImageView.h"
@interface DrawImageViewcontroller ()

@end

@implementation DrawImageViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DrawImageView * image = [[DrawImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    image.backgroundColor = [UIColor grayColor];
    [self.view addSubview:image];
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
