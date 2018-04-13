//
//  CPCall.h
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPCall : NSObject

+ (instancetype)shareInstance;

- (void)call:(NSString *)phoneNumber;

@end
