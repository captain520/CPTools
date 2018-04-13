//
//  CPLeftRightCell.h
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTableViewCell.h"

@interface CPLeftRightCell : CPTableViewCell

@property (nonatomic, copy) NSString *leftValue, *rightValue;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, assign) BOOL needIcon;

@end
