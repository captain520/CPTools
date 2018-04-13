//
//  ViewController.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "ViewController.h"
#import "CPLeftRightCell.h"
#import "CPListTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setupUI];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"" ofType:@"plist"];
    
    NSArray *configArray = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    self.models = [NSMutableArray arrayWithArray:configArray];
    NSLog(@"%@",configArray);
    
    [self loadData];
}

- (void)setupUI {
    
    [self setTitle:@"功能列表"];
}

#pragma mark - Tabelview delegate && datasource method

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentify = @"CellIdentify";
    
    CPLeftRightCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[CPLeftRightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.needIcon = YES;
    }
    
    NSDictionary *configDict = self.models[indexPath.row];
    cell.leftValue = configDict[@"className"];
    cell.rightValue = configDict[@"functionDes"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSDictionary *configDict = self.models[indexPath.row];

    [self push2VCWith:configDict[@"className"] title:configDict[@"classDes"]];
    
//    CPLeftRightCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    CGRect frame = [cell convertRect:cell.bounds toView:tableView];
//    CGRect tFrame = CGRectMake(frame.size.width/2, frame.origin.y + frame.size.height, 100, 200);
//
//    CPListTableView *tb = [[CPListTableView alloc] initWithFrame:tFrame style:UITableViewStyleGrouped dataArray:@[@"1",@"2",@"3",@"4",@"5"]];;
//    tb.layer.shadowColor = UIColor.greenColor.CGColor;
//    tb.layer.shadowOffset = CGSizeMake(5, 5);
//    tb.layer.shadowRadius = 5;
//    tb.layer.shadowOpacity = 0.5f;
//    
//    [tableView addSubview:tb];
//    
//    [UIView animateWithDuration:.250f animations:^{
//       tb.frame = CGRectMake(frame.size.width/2, frame.origin.y + frame.size.height, 100, 200);
//    }];

}


@end
