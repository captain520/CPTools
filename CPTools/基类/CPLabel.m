//
//  CPLabel.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPLabel.h"

@implementation CPLabel

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initalizeBaseProperties];
    }
    
    return self;
}

- (void)initalizeBaseProperties {
    self.font          = CPFont_M;
    self.textColor     = C33;
    self.numberOfLines = 0;
}

@end
