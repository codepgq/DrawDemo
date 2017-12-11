//
//  ImageClipRectImageViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ImageClipRectImageViewcontroller.h"
#import "UIImage+PQImage.h"
#import "UIView+pgqViewExtension.h"
#import "PQWipeView.h"
@interface ImageClipRectImageViewcontroller ()

@property (nonatomic,strong) PQWipeView * wipeView;
@property (nonatomic,strong) UIImageView * imgView;

@end

@implementation ImageClipRectImageViewcontroller{
    UIImage *_image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    //添加一个右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定裁剪" style:UIBarButtonItemStylePlain target:self action:@selector(cutFinish)];
    
    _image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"back.jpg" ofType:nil]];
    //添加一个背景图片
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    imgView.image = _image;
    [self.view addSubview:imgView];
    self.imgView = imgView;
    self.imgView.userInteractionEnabled = YES;
    
    _wipeView = [[[NSBundle mainBundle]loadNibNamed:@"PQWipeView" owner:self options:nil] firstObject];
    [self.imgView addSubview:_wipeView];
}

- (void)cutFinish{
    
    [UIImage pq_cutScreenWithView:self.imgView cutFrame:self.wipeView.frame successBlock:^(UIImage * _Nullable image, NSData * _Nullable imagedata) {
        if (image) {
            NSLog(@"截取成功");
            NSString * path = [NSString stringWithFormat:@"%@/Documents/cutSome.jpg",NSHomeDirectory()];
            
            if( [imagedata writeToFile:path atomically:YES]){
                NSLog(@"保存成功%@",path);
            }
            
            self.imgView.hidden = YES;
            
            UIImageView * imagev = [[UIImageView alloc]initWithImage:image];
            imagev.x = 0;
            imagev.y = 64;
            [self.view addSubview:imagev];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
