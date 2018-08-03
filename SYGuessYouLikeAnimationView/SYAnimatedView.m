//
//  SYAnimatedView.m
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 8/3/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import "SYAnimatedView.h"
#import <UIView+CHFrame.h>

@implementation SYAnimatedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5;
        [self.layer setMasksToBounds:YES];
        
        self.backgroundColor = [UIColor colorWithRed:255/255.0 green:238/255.0 blue:241/255.0 alpha:1/1.0];

        self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 60)];
        self.leftImageView.image = [UIImage imageNamed:@"face"];
        
        self.topLabel      = [self topLabel];
        self.bottomLabel   = [self bottomLabel];
        self.closeButton = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width-10-17, 10, 17, 17)];
        [self.closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
//        [self.closeButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        
        [self addSubview:self.leftImageView];
        [self addSubview:self.topLabel];
        [self addSubview:self.bottomLabel];
        [self addSubview:self.closeButton];
        
    }
    return self;
}


- (UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.leftImageView.right+5, self.topLabel.bottom+3, 250, 18);
        label.text = @"超声波洗牙 | 适应期第7天";
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        _bottomLabel = label;
    }
    return _bottomLabel;
}


- (UILabel *)topLabel
{
    if (!_topLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.leftImageView.right+5, 10, 200, 18);
        label.text = @"亲～您最近的体验项目";
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        _topLabel = label;
    }
    return _topLabel;
}
@end
