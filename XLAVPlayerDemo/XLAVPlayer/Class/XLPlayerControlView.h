//
//  XLPlayerControlView.h
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLPlayerUtil.h"

@interface XLPlayerControlView : UIView

/**
 用于更新全屏按钮状态
 */
@property (nonatomic, assign) BOOL fullScreen;

/**
 用于更新播放进度、时间等信息
 */
@property (nonatomic, strong) AVPlayerItem *item;

/**
 添加控制视图的回调方法
 */
-(void)addControlBlockPlay:(PlayBlock)playBlock seek:(SeekBlock)seekBlock fullScreen:(FullScreenBlock)fullScreenBlock back:(VoidBlock)back;

/**
 快进时不更新进度条进度，快进结束后自动更新进度条
 */
-(void)seekFinished;

/**
 点击屏幕显示/隐藏控制view
 */
- (void)hide;
- (void)show;

@end
