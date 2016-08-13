//
//  DrawLineViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawLineViewcontroller.h"
#import "DrawLineView.h"
@interface DrawLineViewcontroller ()


@end

@implementation DrawLineViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__func__);
    self.view.backgroundColor = [UIColor whiteColor];
    DrawLineView * line = [[DrawLineView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)loadView{
    [super loadView];
    NSLog(@"%s",__func__);
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
