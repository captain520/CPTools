//
//  CPTestCollectionView.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/13.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPTestCollectionView.h"

#define CELL_IEDENTIFY  @"Cell"

@implementation CPTestCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.delegate = self;
        
        [self initializedBasePeroperties];
    }
    
    return self;
}

- (void)initializedBasePeroperties {
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELL_IEDENTIFY];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_IEDENTIFY forIndexPath:indexPath];
    cell.contentView.backgroundColor = UIColor.redColor;
    
    return cell;
}

@end
