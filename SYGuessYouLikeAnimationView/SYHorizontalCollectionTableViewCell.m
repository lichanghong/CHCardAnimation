//
//  SYHorizontalCollectionTableViewCell.m
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 8/2/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import "SYHorizontalCollectionTableViewCell.h"
#import <UIView+CHFrame.h>
#import "SYAnimatedView.h"
#import <UIColor+Util.h>
#import "UIView+Shadow.h"
#import "SYHorizontalHomeCollectionViewCell.h"

@interface SYHorizontalCollectionTableViewCell()<UICollectionViewDelegate,
UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray   *itemArr;
@property (nonatomic, strong) SYAnimatedView   *animatedView;
//箭头
@property (nonatomic,strong)UIImageView *arrowImageView;
@property (nonatomic,assign)BOOL isOpen;
@property (nonatomic,assign)SYHorizontalHomeCollectionViewCell *arrowCollectionViewCell;

@end

@implementation SYHorizontalCollectionTableViewCell

 
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.itemArr = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5", nil];
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.headerReferenceSize = CGSizeZero;
        flowLayout.footerReferenceSize = CGSizeZero;
        flowLayout.itemSize = CGSizeMake(95, 50);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 15, 0, 15);
        flowLayout.minimumInteritemSpacing = 10;
        
        CGRect rect = CGRectMake(0,0,KScreenWidth,74);
        _collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.contentInset = UIEdgeInsetsMake(0, 1, 0, 1);
        [_collectionView registerClass:
         [SYHorizontalHomeCollectionViewCell class] forCellWithReuseIdentifier:[SYHorizontalHomeCollectionViewCell identifier]];
        
        self.animatedView = [[SYAnimatedView alloc]initWithFrame:CGRectMake(15, 10, KScreenWidth-15*2, 59)];
        self.arrowImageView.frame = CGRectMake(self.contentView.centerX, 69-10, 29, 19);
        self.arrowImageView.alpha = 0;

        [self.animatedView.closeButton addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.animatedView];
        [self.contentView addSubview:_collectionView];
        [self.contentView addSubview:self.arrowImageView];


    }
    return self;
}

- (void)handleAction:(id)sender
{
    if (self.closeAction) {
        self.closeAction();
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.animatedView.bottom = self.contentView.bottom - 20;

}

- (void)open:(BOOL)open
{
    _isOpen = open;
    CGFloat y = 59;
    CGFloat alpha = 0;
    if (open) {
        y = self.animatedView.bottom;
        alpha = 1;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.arrowImageView.alpha = alpha;
    }];
    [UIView animateWithDuration:0.5 animations:^{
        self.arrowImageView.y = y;
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SYHorizontalHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[SYHorizontalHomeCollectionViewCell identifier] forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
//    cell.layer.cornerRadius = 5;
    cell.layer.borderWidth = 0.5;
    cell.layer.borderColor = [UIColor colorForHex:@"f1f1f1"].CGColor;
    
    cell.layer.shadowColor = [[UIColor blackColor]colorWithAlphaComponent:0.05].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 4);
    cell.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 5;
    
    if (indexPath.item == 2) {
        self.arrowCollectionViewCell = cell;
        self.arrowImageView.centerX = cell.centerX;
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_isOpen) {
        self.arrowImageView.centerX = self.arrowCollectionViewCell.centerX-scrollView.contentOffset.x;
    }
}

- (UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc]init];
        _arrowImageView.image = [UIImage imageNamed:@"home_arrow"];
    }
    return _arrowImageView;
}

+ (NSString *)identifier
{
    return NSStringFromClass(self);
}

//- (UIView *)createTimeBG
//{
//    UIView *view = [[UIView alloc]init];
//    view.backgroundColor = [UIColor clearColor];
//    view.layer.shadowOffset = CGSizeMake(0, 2);
//    view.layer.shadowColor  =  [[UIColor blackColor] colorWithAlphaComponent:0.35].CGColor;
//    view.layer.shadowOpacity = 1;
//
//    CALayer *sublayer =[CALayer layer];
//    sublayer.frame = CGRectMake(0, 0, 20, 20);
//    sublayer.backgroundColor = [UIColor sy_black2Color].CGColor;
//    sublayer.cornerRadius = 2;
//    sublayer.masksToBounds = YES;
//    [view.layer addSublayer:sublayer];
//    return view;
//}
@end
