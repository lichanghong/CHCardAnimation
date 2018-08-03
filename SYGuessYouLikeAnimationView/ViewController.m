//
//  ViewController.m
//  SYGuessYouLikeAnimationView
//
//  Created by lichanghong on 7/31/18.
//  Copyright © 2018 lichanghong. All rights reserved.
//

#import "ViewController.h"
#import <UIColor+Util.h>
#import "SYCardAnimationTableViewCell.h"
#import "SYHorizontalCollectionTableViewCell.h"
#import <UIView+CHFrame.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController
{
    bool open;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    open = NO;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 100, 50)];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"face"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, KScreenWidth, 500)];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[SYCardAnimationTableViewCell class] forCellReuseIdentifier:[SYCardAnimationTableViewCell identifier]];
    [self.tableView registerClass:[SYHorizontalCollectionTableViewCell class] forCellReuseIdentifier:[SYHorizontalCollectionTableViewCell identifier]];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setAllowsSelection:NO];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)handleAction:(id)sender
{
    open = !open;
    
    SYHorizontalCollectionTableViewCell *horizontalCell = nil;
    for (UITableViewCell *cell in [self.tableView visibleCells]) {
        if ([cell isKindOfClass:[SYHorizontalCollectionTableViewCell class]]) {
            horizontalCell = (SYHorizontalCollectionTableViewCell *)cell;
            break;
        }
    }
    
    [horizontalCell open:open];

//    NSIndexPath *indexPath =  [self.tableView indexPathForCell:horizontalCell];
//    if (indexPath) {
//        [UIView animateWithDuration:2 animations:^{
//            [UIView performWithoutAnimation:^{
//                [self.tableView reloadData];
//            }];
//        }];
//            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    } completion:^(BOOL finished) {
        
    }];
 
//    }
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 177 * self.view.bounds.size.width/375.0;
    }
    else
    {
        if (open) {
            return 90+59+14;
        }
        return 90;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        SYCardAnimationTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:[SYCardAnimationTableViewCell identifier] forIndexPath:indexPath];
        cell1.titleLabel.text = @"猜你喜欢";
        cell = cell1;
    }
    else
    {
        SYHorizontalCollectionTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:[SYHorizontalCollectionTableViewCell identifier] forIndexPath:indexPath];
        cell1.backgroundColor = [UIColor clearColor];
        cell1.closeAction = ^{
            [self handleAction:nil];//close
        };
        cell= cell1;
    }
 
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
