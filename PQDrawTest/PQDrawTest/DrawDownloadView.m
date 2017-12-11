//
//  DrawDownloadView.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawDownloadView.h"

@interface DrawDownloadView ()

@property (weak,nonatomic) IBOutlet UILabel * textLabel;
@property (nonatomic,strong) CABasicAnimation * animation;
@end

@implementation DrawDownloadView

- (void)awakeFromNib{
    self.backgroundColor = [UIColor clearColor];
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    _textLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress*100];
    _textLabel.textColor = [UIColor colorWithRed:self.progress green:0 blue:0 alpha:1];
    //重绘
    [self setNeedsDisplay];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGFloat startA = - M_PI_2;
    CGFloat endA =  - M_PI_2 + self.progress * M_PI * 2;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5) radius:self.bounds.size.width*0.5-10 startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor colorWithRed:self.progress green:(1-self.progress) blue:0 alpha:1]setStroke];
    path.lineWidth = 5;
    [path stroke];
    
}


@end
