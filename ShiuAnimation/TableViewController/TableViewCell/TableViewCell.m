//
//  TableViewCell.m
//  ShiuAnimation
//
//  Created by AllenShiu on 2017/1/23.
//  Copyright © 2017年 AllenShiu. All rights reserved.
//

#import "TableViewCell.h"
#import "CollectionViewCell.h"

static NSString *identifier = @"CollectionViewCell";

@interface TableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TableViewCell

#pragma mark - properties

- (void)setItems:(NSArray *)items {
    _items = items;
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(collectionViewDidSelectedItemIndexPath:collcetionView:forCell:)]) {
        [self.delegate collectionViewDidSelectedItemIndexPath:indexPath collcetionView:collectionView forCell:self];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.petImageView.image = [UIImage imageNamed:self.items[indexPath.row]];
    return cell;
}

#pragma mark - private instance method

#pragma mark * init values

- (void)setupCollectionView {
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:identifier];
}

#pragma mark - life cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupCollectionView];
}

@end
