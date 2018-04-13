//
//  CPTextFieldTestVC.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/12.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPTextFieldTestVC.h"
#import "CPCheckTextField.h"

@interface CPTextFieldTestVC ()<UITextFieldDelegate>

@property (nonatomic, strong) CPCheckTextField *checkTF;
@property (nonatomic, strong) UITextField *tf;

@end

@implementation CPTextFieldTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
    self.view.backgroundColor = UIColor.whiteColor;

    self.checkTF.backgroundColor = UIColor.grayColor;

    _checkTF = [[CPCheckTextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    _checkTF.dataType = CPTextFiledDataTypeAlphabet;
    _checkTF.isUpercaseString = YES;
    _checkTF.errorMsg = @"电话号码错误,请校对您输入的电话号码是否争取";

    [self.view addSubview:_checkTF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
