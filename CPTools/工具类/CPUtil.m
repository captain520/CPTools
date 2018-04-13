//
//  CPUtil.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPUtil.h"
#import <UIKit/UIKit.h>

@implementation CPUtil

- (void)call:(NSString *)phoneNumber {
    NSMutableString* str= [[NSMutableString alloc]initWithFormat:@"telprompt://%@",phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


@end

