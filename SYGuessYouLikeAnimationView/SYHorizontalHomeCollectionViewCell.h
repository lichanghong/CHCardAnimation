//
//  SYHorizontalHomeCollectionViewCell.h
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 8/3/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYHorizontalHomeCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)UILabel     *titleLabel;
@property (nonatomic,strong)UILabel     *subTitleLabel;
@property (nonatomic,strong)UIImageView *imageView;

+ (NSString*)identifier;


@end
