//
//  CHCardAnimationView.m
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 8/1/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import "CHCardAnimationView.h"
#import <UIView+CHFrame.h>
#import <UIColor+Util.h>
#import "SYCardAnimationContentView.h"
#import "UIView+Shadow.h"

#define xxxScreenW (UIScreen.mainScreen.bounds.size.width)
#define xxxScreenH (UIScreen.mainScreen.bounds.size.height)


@interface CHCardAnimationView()
@property (nonatomic,strong)NSMutableArray *cardViewArr;
@property (nonatomic, assign) NSInteger bottomShowCardIndex;
@property (nonatomic, assign) CGPoint cardInwindowCenter;

@end

@implementation CHCardAnimationView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.cardViewArr = [NSMutableArray array];
        self.showOverlayCount = 3;
    }
    return self;
}

- (void)show
{
    NSInteger count = self.showOverlayCount;
    for (NSInteger i = 0; i < count; i++) {
        UIView *view = [self createSubCardViewAtIndex:i];
        [self.cardViewArr addObject:view];
    }
}

- (UIView *)createSubCardViewAtIndex:(NSInteger)index
{
    NSInteger count = self.showOverlayCount;
    CGFloat cardOffset = 6;
    CGFloat cardHeight = self.height - (self.showOverlayCount-1)*cardOffset;
    CGFloat left = 15;
    CGFloat x = left*(count-index);
    CGRect rect = CGRectMake(x, index*cardOffset, self.width-x*2, cardHeight);
    SYCardAnimationContentView *cardView = [[SYCardAnimationContentView alloc]initWithFrame:rect];
    cardView.portraitImageView.image = [UIImage imageNamed:@"head"];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
    [cardView addGestureRecognizer:pan];
    [self addSubview:cardView];
    
    //        [self addGesture:cardView];
    
    //        if ([_delegate respondsToSelector:@selector(customCardView:index:cardStore:)] && self.customCardView) {
    //            [_delegate customCardView:cardView index:i cardStore:self];
    //        }else{
    //            UIImageView *imageV = [UIImageView new];
    //            [cardView addSubview:imageV];
    //            imageV.frame = CGRectMake(0, 0, self.width_xxx, self.cardHeight);
    //            [imageV sd_setImageWithURL:[NSURL URLWithString:self.imgUrlStrArr[i]] placeholderImage:self.placeholderImage];
    //            imageV.contentMode = self.imgContentMode;
    //            imageV.tag = IMGV_Tag;
    //        }
//    [self animationView:cardView scale:1.0-offset*(count-index) duration:0.1];
    return cardView;
}

- (void)panGes:(UIPanGestureRecognizer *)pan {
    UIView *cardView = pan.view;

    if (pan.state == UIGestureRecognizerStateBegan) {
        [self.cardViewArr removeLastObject];
        UIView *addview = [self createSubCardViewAtIndex:0];
        [self sendSubviewToBack:addview];
        [self.cardViewArr insertObject:addview atIndex:0];

        CGFloat cardOffset = 6;
        CGFloat cardHeight = self.height - (self.showOverlayCount-1)*cardOffset;
        NSInteger count = self.showOverlayCount;

        for (NSInteger i = 0; i < self.cardViewArr.count; i++) {
            UIView *view = [self.cardViewArr objectAtIndex:i];
            CGFloat left = 10;
            CGFloat x = left*(count-i);
            CGRect rect = CGRectMake(x, i*cardOffset, self.width-x*2, cardHeight);
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut | UIViewAnimationOptionLayoutSubviews animations:^{
                view.frame = rect;

            } completion:^(BOOL finished) {
                
                
            }];
            
        }
        
        UIWindow *kWindow = [UIApplication sharedApplication].keyWindow;
        self.cardInwindowCenter = [cardView convertPoint:cardView.center toView:kWindow];
        [[UIApplication sharedApplication].keyWindow addSubview:cardView];
    }
        CGPoint transLcation = [pan translationInView:self];
        cardView.center = CGPointMake(self.cardInwindowCenter.x+transLcation.x, self.cardInwindowCenter.y+transLcation.y);
        
        float xP = transLcation.x / (self.width/2.0);
        if (xP < -1) xP = -1;
        if (xP > 1) xP = 1;
        CGFloat rotation = M_PI_2/4*xP;
    
        [self animationView:cardView rotate:rotation];
    if (pan.state == UIGestureRecognizerStateEnded) {
        //动画效果移除拖动的视图
        CGPoint translation = [pan translationInView:self];
        CGPoint velocity =  [pan velocityInView:self];
        float xP2 = translation.x / (self.width/2.0);
        if (xP2 < -1) xP2 = -1;
        if (xP2 > 1) xP2 = 1;
        
        CGFloat x = velocity.x>0?(velocity.x+xxxScreenW):(velocity.x-xxxScreenW);
        CGFloat y = velocity.y>0?(velocity.y+xxxScreenH):(velocity.y-xxxScreenH);
        CGPoint outCenter = CGPointMake(x, y);
        NSLog(@"velo---%f,%f",x,y);
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut animations:^{
            cardView.center = outCenter;

        } completion:^(BOOL finished) {
            [cardView removeFromSuperview];
        }];
    }
    
}



- (void)animationView:(UIView *)cardView rotate:(CGFloat)angle {
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut | UIViewAnimationOptionLayoutSubviews animations:^{
        cardView.transform = CGAffineTransformRotate(CGAffineTransformScale(CGAffineTransformIdentity, 1, 1), angle);
    } completion:^(BOOL finished) {
    }];
}
 
@end
