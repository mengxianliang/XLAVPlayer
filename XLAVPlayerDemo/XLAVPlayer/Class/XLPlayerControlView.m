//
//  XLPlayerControlView.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLPlayerControlView.h"
#import "XLPlayerTopBar.h"
#import "XLPlayerBottomBar.h"
#import "XLPlayerPanView.h"

@interface XLPlayerControlView () {
    
    XLPlayerTopBar *_topBar;
    
    XLPlayerBottomBar *_bottomBar;
    
    UIButton *_playButton;
    
    PlayBlock _playBlock;
    
    BOOL _isHidden;
    
    XLPlayerPanView *_panView;
}
@end

@implementation XLPlayerControlView

-(instancetype)init
{
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI
{
    
    _panView = [[XLPlayerPanView alloc] init];
    [self addSubview:_panView];
    
    
    _topBar = [[XLPlayerTopBar alloc] init];
    [self addSubview:_topBar];
    
    _bottomBar = [[XLPlayerBottomBar alloc] init];
    [self addSubview:_bottomBar];
    
    _playButton = [[UIButton alloc] init];
    [_playButton setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateNormal];
    [_playButton setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateSelected];
    [_playButton addTarget:self action:@selector(playMethod:) forControlEvents:UIControlEventTouchUpInside];
    _playButton.frame = CGRectMake(0, 0, 60, 60);
    _playButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    _playButton.layer.cornerRadius = _playButton.bounds.size.height/2.0f;
    _playButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _playButton.layer.masksToBounds = true;
    [self addSubview:_playButton];
}

- (CGFloat)barHeight {
    return 40.0f;
}

- (CGFloat)bottomBarY {
    return self.bounds.size.height - [self barHeight];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _topBar.frame = CGRectMake(0, 0, self.bounds.size.width, [self barHeight]);
    
    _bottomBar.frame = CGRectMake(0, [self bottomBarY], self.bounds.size.width, [self barHeight]);
    _playButton.center = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    
    _panView.frame = self.bounds;
}

#pragma mark -
#pragma mark Setters

- (void)setItem:(AVPlayerItem *)item {
    _item = item;
    _bottomBar.item = item;
}

-(void)setFullScreen:(BOOL)fullScreen{
    _fullScreen = fullScreen;
    _bottomBar.fullScreen = fullScreen;
}

#pragma mark -
#pragma mark 功能方法

- (void)addControlBlockPlay:(PlayBlock)playBlock seek:(SeekBlock)seekBlock fullScreen:(FullScreenBlock)fullScreenBlock back:(VoidBlock)back {
    _playBlock = playBlock;
    
    [_bottomBar addSeekBlock:seekBlock];
    
    [_bottomBar addFullScreenBlock:fullScreenBlock];
    
    [_topBar addBackBlock:back];
}

- (void)playMethod:(UIButton*)button {
    button.selected = !button.selected;
    _playBlock(button.selected);
}

- (void)seekFinished {
    [_bottomBar seekFinished];
}

//隐藏播放按钮、隐藏顶部、底部工具栏
- (void)hideMethod {
    _isHidden = !_isHidden;
    _topBar.hidden = _isHidden;
    _bottomBar.hidden = _isHidden;
    _playButton.hidden = _isHidden;
    
    //点击显示后，三秒后自动隐藏
    if (!_isHidden) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [self performSelector:@selector(hideMethod) withObject:nil afterDelay:3];
    }
}

@end
