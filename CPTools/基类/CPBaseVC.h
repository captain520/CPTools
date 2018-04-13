//
//  CPBaseVC.h
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPBaseVC : UIViewController


/**
 页面跳转

 @param className 控制器类名
 @param title 控制器标题
 */
- (void)push2VCWith:(NSString *)className title:(NSString *)title;

@end
