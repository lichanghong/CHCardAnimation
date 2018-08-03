//
//  SYHorizontalCollectionTableViewCell.h
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 8/2/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYHorizontalCollectionTableViewCell : UITableViewCell

@property (nonatomic,copy)dispatch_block_t closeAction;

+ (NSString*)identifier;
- (void)open:(BOOL)open;

@end
