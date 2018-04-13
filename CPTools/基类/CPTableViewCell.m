//
//  CPTableViewCell.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPTableViewCell.h"

@implementation CPTableViewCell {
    
    CPView *bottomLine;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        
        [self setupBottomLine];
    }
    
    return self;
}

- (void)setupBottomLine {
    
    bottomLine = [CPView new];
    bottomLine.backgroundColor = UIColor.redColor;
    
    [self.contentView addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(CPBoardWidth);
    }];

}

- (void)setupUI {
    
}

- (void)setNeedSepLine:(BOOL)needSepLine {
    
    _needSepLine = needSepLine;
    
    if (NO == needSepLine) {
        [bottomLine removeFromSuperview];
    }
}

@end
