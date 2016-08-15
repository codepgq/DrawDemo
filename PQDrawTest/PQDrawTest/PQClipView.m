//
//  PQClipView.m
//  PQDrawTest
//
//  Created by ios on 16/8/15.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PQClipView.h"
#import "UIView+pgqViewExtension.h"
@interface PQClipView ()

@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *bottomPan;

@end

@implementation PQClipView{
    CGPoint startP;
    CGPoint endP;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.y = 64;
    
    [self.bottomView addGestureRecognizer:self.bottomPan];
}

- (IBAction)moveView:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            startP = [sender locationInView:self];
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGPoint nowPoint = [sender locationInView:self];
            CGFloat x = (nowPoint.x  - startP.x);
            CGFloat y = (nowPoint.y  - startP.y);
            self.frame = CGRectMake(x + self.x, y + self.y, self.width, self.height);
        }
            break;
            
        default:
            break;
    }
    
}

- (IBAction)bottomView:(UIPanGestureRecognizer *)sender {
    CGPoint sP;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            sP = [sender locationInView:self];
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGPoint nowPoint = [sender locationInView:self];
            CGFloat w = (fabs(nowPoint.x - sP.x));
            CGFloat h = (fabs(nowPoint.y - sP.y));
            self.frame = CGRectMake(self.x, self.y, w, h);
        }
            break;
            
        default:
            break;
    }
}



@end
