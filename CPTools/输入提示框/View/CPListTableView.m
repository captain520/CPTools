//
//  CPListTableView.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/13.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPListTableView.h"

@implementation CPListTableView {
    NSArray *dataArray;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style dataArray:(NSArray *)data {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        dataArray = data;
        
        self.delegate = self;
        self.dataSource = self;
        
        [self setupUI];

    }
    
    return self;
}

- (void)setupUI {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 5.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = UIColor.redColor.CGColor;
    
//    self.layer.shadowColor = UIColor.greenColor.CGColor;
//    self.layer.shadowOffset = CGSizeMake(1, 1);
//    self.layer.shadowRadius = 1;
//    self.layer.shadowOpacity = 0.5f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1;}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return  dataArray.count;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdenitify = @"UITabeleViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenitify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenitify];
    }
    
    cell.textLabel.text = dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {return 0.00000001f;}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {return  nil;}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section { return 0.00000001f;}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {return nil;}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self removeFromSuperview];
}

@end
