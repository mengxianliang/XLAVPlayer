//
//  XLPlayerTopBar.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLPlayerTopBar.h"

@interface XLPlayerTopBar () {
    UIButton *_backButton;
    
    UILabel *_titleLabel;
    
    VoidBlock _backBlock;
}
@end

@implementation XLPlayerTopBar

- (instancetype)init {
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    _backButton = [[UIButton alloc] init];
    [_backButton setImage:[UIImage imageNamed:@"player_backButton"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backButton];
    
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 5.0f;
    CGFloat height = self.bounds.size.height - 2*margin;
    CGFloat btnWidth = height;
    CGFloat labelWidth = self.bounds.size.width - btnWidth - 3*margin;
    
    _backButton.frame = CGRectMake(margin, margin, btnWidth, height);
    
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_backButton.frame) + margin, margin, labelWidth, height);
}

- (void)backMethod {
    _backBlock();
}

#pragma mark -
#pragma mark 功能方法
- (void)addBackBlock:(VoidBlock)block {
    _backBlock = block;
}

@end
