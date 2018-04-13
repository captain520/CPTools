//
//  CPTextFieldTestVC.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/12.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPTextFieldTestVC.h"
#import "CPCheckTextField.h"
#import "CPToast.h"
#import "CPTestCollectionView.h"

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

//    self.checkTF.backgroundColor = UIColor.grayColor;
//
//    _checkTF = [[CPCheckTextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
//    _checkTF.dataType = CPTextFiledDataTypeAlphabet;
//    _checkTF.isUpercaseString = YES;
//    _checkTF.errorMsg = @"电话号码错误,请校对您输入的电话号码是否争取";
//
//    [self.view addSubview:_checkTF];
    
//    CPButton *bt = [[CPButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
//    bt.backgroundColor = UIColor.greenColor;
//    [bt setTitleColor:UIColor.blackColor forState:0];
//    [bt setTitle:@"Test" forState:0];
//    bt.actionBlock = ^{
//        DDLogInfo(@"------------");
//
//    };

//    bt.layer.shadowOpacity = 0.5f;
//    bt.layer.shadowRadius = 5;
//    bt.layer.shadowOffset = CGSizeMake(5, 5);
//    bt.layer.shadowColor = UIColor.redColor.CGColor;
    
//    [self.view addSubview:bt];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(SCREENWIDTH, 100);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    CPTestCollectionView *cv = [[CPTestCollectionView alloc] initWithFrame:CGRectMake(0, 100, SCREENWIDTH, 100) collectionViewLayout:layout];

    [self.view addSubview:cv];
}

- (void)buttonAction:(UIButton *)bt {
    
    CGPoint p = [bt convertPoint:bt.bounds.origin toView:self.view];
    CPToast *t = [[CPToast alloc] initWithFrame:CGRectMake(p.x + bt.frame.size.width, p.y, 100, 30)];
    t.text = @"电话号码错误,请校对您输入的电话号码是否争取";
    t.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];

    [self.view addSubview:t];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
