//
//  ImageClipCircleAndBorderViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ImageClipCircleAndBorderViewcontroller.h"
#import "UIImage+PQImage.h"
@interface ImageClipCircleAndBorderViewcontroller ()

@end

@implementation ImageClipCircleAndBorderViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    UIImage * image = [UIImage imageNamed:@"222"];
    imageView.image = [UIImage pq_ClipCircleImageWithImage:image circleRect:CGRectMake(0, 0, image.size.width, image.size.height) borderWidth:10 borderColor:[UIColor greenColor]];
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
