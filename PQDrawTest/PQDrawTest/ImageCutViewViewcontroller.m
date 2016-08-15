//
//  ImageCutViewViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ImageCutViewViewcontroller.h"
#import "UIImage+PQImage.h"
@interface ImageCutViewViewcontroller ()

@end

@implementation ImageCutViewViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage * image = [UIImage imageNamed:@"222"];
    
    //添加一个些东西
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 100, 20)];
    label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(100, 150, 100, 200)];
    view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.view addSubview:view];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 400, 50, 40);
    
    self.title = @"点击空白区，进行截屏";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIImage pq_cutScreenWithView:self.view successBlock:^(UIImage * _Nullable image, NSData * _Nullable imagedata) {
        if (image) {
            NSLog(@"截取成功");
            NSString * path = [NSString stringWithFormat:@"%@/Documents/cut.jpg",NSHomeDirectory()];
            
            if( [imagedata writeToFile:path atomically:YES]){
                NSLog(@"保存成功%@",path);
            }
            
        }
        
        
    }];
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
