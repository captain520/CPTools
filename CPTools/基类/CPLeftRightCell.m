//
//  CPLeftRightCell.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPLeftRightCell.h"

@implementation CPLeftRightCell {
    CPLabel *leftLB, *rightLB;
    UIImageView *iconIV;
}

- (void)setupUI {

    {
        leftLB = [CPLabel new];
        
        [self.contentView addSubview:leftLB];
        [leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(cellSpaceOffset);
            make.bottom.mas_equalTo(0);
        }];
    }
    
    {
        rightLB = [CPLabel new];
        
        [self.contentView addSubview:rightLB];
        [rightLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-cellSpaceOffset);
            make.bottom.mas_equalTo(0);
        }];
    }
}

- (void)setNeedIcon:(BOOL)needIcon {
    
    _needIcon = needIcon;
    
    if ( _needIcon && !iconIV) {
        
        iconIV = [CPImageView new];
        iconIV.contentMode = UIViewContentModeCenter;

        [self.contentView addSubview:iconIV];
        [iconIV setImage:CPImage(@"right")];
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(15, 15));
//            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-cellSpaceOffset);
//            make.bottom.mas_equalTo(0);
        }];
        
        [rightLB mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(iconIV.mas_left).offset(-CPTOP_BOTTOM_OFFSET_F);
            make.bottom.mas_equalTo(0);
        }];
    }
}

- (void)setLeftValue:(NSString *)leftValue {
    
    _leftValue = leftValue;
    
    leftLB.text = _leftValue;

}

- (void)setRightValue:(NSString *)rightValue {
    
    _rightValue = rightValue;
    
    rightLB.text = _rightValue;
}

@end
