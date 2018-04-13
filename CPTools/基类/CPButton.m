//
//  CPButton.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPButton.h"

@implementation CPButton

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initializedBaseProperties];
    }
    
    return self;
}

- (void)initializedBaseProperties {
    
    {
        self.layer.shadowColor   = UIColor.redColor.CGColor;
        self.layer.shadowRadius  = 5;
        self.layer.shadowOffset  = CGSizeMake(5, 5);
        self.layer.shadowOpacity = 0.5f;
    }
    
    {
        [self addTarget:self action:@selector(downAction:) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragInside | UIControlEventTouchDragEnter];
        [self addTarget:self action:@selector(upAction:) forControlEvents:UIControlEventTouchCancel| UIControlEventTouchDragOutside| UIControlEventTouchDragExit | UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(toggleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)downAction:(CPButton *)sender {
    
    [UIView animateWithDuration:0.25f animations:^{
        self.transform = CGAffineTransformMakeScale(1.1, 1.1);
    }];
}

- (void)upAction:(id)sender {
    
    [UIView animateWithDuration:0.25f animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

- (void)toggleAction:(id)sender {
    [self upAction:sender];
    
    !self.actionBlock ? : self.actionBlock();
}


@end
