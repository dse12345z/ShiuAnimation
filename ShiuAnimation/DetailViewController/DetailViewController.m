//
//  DetailViewController.m
//  ShiuAnimation
//
//  Created by AllenShiu on 2017/1/23.
//  Copyright © 2017年 AllenShiu. All rights reserved.
//

#import "DetailViewController.h"
#import "UIView+Shiu.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation DetailViewController

#pragma mark - IBAction

- (IBAction)buttonAction:(id)sender {
    // 執行關閉的動畫
    self.closeBlock();
}

#pragma mark - private instance method

#pragma mark * init values

- (void)setupViews {
    // 設定顯示圖片
    self.imageView.image = self.selectImage;
    
    // 設定按鈕
    self.button.alpha = 0;
    NSLayoutConstraint *constraintTop = [self.button constraintTopWithSuper];
    constraintTop.constant = 25;
    [self.view layoutIfNeeded];
    
    // 設定 navigationBar 隱藏
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark * animate

- (void)setupShowButton {
    // 動畫顯示按鈕
    __weak DetailViewController *weakSelf = self;
    NSLayoutConstraint *constraintTop = [self.button constraintTopWithSuper];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations: ^{
        constraintTop.constant = 0;
        weakSelf.button.alpha = 1;
        [weakSelf.view layoutIfNeeded];
    } completion:nil];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupShowButton];
}

- (void)dealloc {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
