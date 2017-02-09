//
//  CollectionViewCell.h
//  ShiuAnimation
//
//  Created by AllenShiu on 2017/1/23.
//  Copyright © 2017年 AllenShiu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger CollectionViewCellWidth = 300;
static NSInteger CollectionViewCellHeight = 236;

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
@property (weak, nonatomic) IBOutlet UILabel *petName;

@end
