//
//  SYHorizontalHomeCollectionViewCell.m
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 8/3/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import "SYHorizontalHomeCollectionViewCell.h"
#import <UIView+CHFrame.h>



@implementation SYHorizontalHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:[self titleLabel]];
        [self.contentView addSubview:[self subTitleLabel]];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(self.width-30, self.titleLabel.bottom, 30, 20);
    
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"cellitem"];
        _imageView.contentMode = UIViewContentModeTopLeft;
    }
    return _imageView;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(7, self.titleLabel.bottom, 80, 15);
        label.text = @"幸运大礼";
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        label.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
        _subTitleLabel = label;
    }
    return _subTitleLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(7, 7, 80, 18);
        label.text = @"每日签到";
        label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        _titleLabel = label;
    }
    return _titleLabel;
}



+ (NSString *)identifier
{
    return NSStringFromClass(self);
}

@end
