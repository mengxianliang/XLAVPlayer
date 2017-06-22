//
//  XLPlayerBottomBar.h
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLPlayerUtil.h"

@interface XLPlayerBottomBar : UIView

/**
 用于显示播放时间、缓冲进度的数据源
 */
@property (nonatomic, strong) AVPlayerItem *item;

/**
 是否是全屏状态
 */
@property (nonatomic ,assign) BOOL fullScreen;

/**
 快进回调方法
 */
-(void)addSeekBlock:(SeekBlock)finish;

/**
 全屏回调方法
 */
-(void)addFullScreenBlock:(FullScreenBlock)fullScreen;

/**
 快进结束后需要通知bottomBar
 */
-(void)seekFinished;

@end
