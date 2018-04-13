//
//  CPTextField.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPTextField.h"

@implementation CPTextField

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializedBaseProperties];
    }
    
    return self;
}

- (void)initializedBaseProperties {
    self.font = CPFont_M;
    self.backgroundColor = UIColor.whiteColor;
}

@end
