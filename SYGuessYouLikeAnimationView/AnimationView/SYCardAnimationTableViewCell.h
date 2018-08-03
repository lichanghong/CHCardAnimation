//
//  SYCardAnimationTableViewCell.h
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 8/2/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCardAnimationView.h"

@interface SYCardAnimationTableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) CHCardAnimationView *cardAnimationView;


+ (NSString*)identifier;

@end
