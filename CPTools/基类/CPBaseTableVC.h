//
//  CPBaseTableVC.h
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPBaseVC.h"

@interface CPBaseTableVC : CPBaseVC<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *models;


/**
 加载数据，刷新数据列表
 */
- (void)loadData;

@end
