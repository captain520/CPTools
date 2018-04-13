//
//  CPBaseTableVC.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPBaseTableVC.h"

@interface CPBaseTableVC ()

@end

@implementation CPBaseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializedBaseProperties];
}

- (void)initializedBaseProperties {
    
    self.models = @[].mutableCopy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter && getter method

- (UITableView *)tableView {
    
    if (nil == _tableView) {
        
        CGRect tableFrame = { 0,
            NAV_HEIGHT,
            SCREENWIDTH,
            SCREENHEIGHT - NAV_HEIGHT};
        
        _tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStyleGrouped];
        _tableView.delegate       = self;
        _tableView.dataSource     = self;
        _tableView.separatorColor = UIColor.clearColor;
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1;}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return self.models.count;}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath { return CELL_HEIGHT_F;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdenitify = @"UITabeleViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenitify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenitify];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section { return 0.0000000001f;}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section { return nil;}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {return 0.00000001f;}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section { return nil;}

- (void)loadData {
    [self.tableView reloadData];
}


@end
