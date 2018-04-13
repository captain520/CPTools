//
//  CPListTableView.h
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/13.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPListTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style dataArray:(NSArray *)data ;

@end
