//
//  CPBaseVC.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPBaseVC.h"

@interface CPBaseVC ()

@end

@implementation CPBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)push2VCWith:(NSString *)className title:(NSString *)title {
    
    Class c = NSClassFromString(className);
    
    UIViewController *vc    = c.new;
    vc.title                = title;
    vc.hidesBottomBarWhenPushed = YES;
    //    vc.view.backgroundColor = UIColor.whiteColor;
    
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
