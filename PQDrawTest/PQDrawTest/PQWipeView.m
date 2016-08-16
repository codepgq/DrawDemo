//
//  PQWipeView.m
//  PQDrawTest
//
//  Created by codepgq on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PQWipeView.h"
#import "UIView+pgqViewExtension.h"
@interface PQWipeView ()

@property (nonatomic,weak) IBOutlet UIButton * sizeBtn;

@end

@implementation PQWipeView{
    CGPoint _startP;
    CGPoint _sizeStartP;
    
    CGSize oldSize;
}

- (void)awakeFromNib{
    self.y = 0;
}

- (IBAction)sizePan:(UIPanGestureRecognizer *)sender {
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            _sizeStartP = [sender locationInView:self];
            oldSize = self.size;
            break;
            
    case UIGestureRecognizerStateChanged:
        {
            CGPoint curP = [sender locationInView:self ];
            
            CGFloat w = curP.x  - _sizeStartP.x;
            CGFloat h = curP.y  - _sizeStartP.y;
            
            self.width = oldSize.width + w;
            self.height = oldSize.height + h;
            
            [self ifOut];
        }
            break;
       
        default:
            break;
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    //得到按下去的点
    _startP = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    
    CGPoint curP = [touch locationInView:self];
    //计算偏移量
    CGFloat x = curP.x - _startP.x;
    CGFloat y = curP.y - _startP.y;
    
    //限制范围 不允许超出屏幕
    
    self.x += x;
    if (self.x <=0) {
        self.x = 0;
    }
    self.y += y;
    if (self.y <= 0) {
        self.y = 0;
    }
    //范围判断
    [self ifOut];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)ifOut{
    if (self.y + self.height >= [UIScreen mainScreen].bounds.size.height-64) {
        self.y =  [UIScreen mainScreen].bounds.size.height - self.height - 64;
    }
    
    if (self.x + self.width >= [UIScreen mainScreen].bounds.size.width) {
        self.x =  [UIScreen mainScreen].bounds.size.width - self.width;
    }
}

@end
