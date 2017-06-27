//
//  XLAVPlayer.h
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLPlayerUtil.h"

typedef NS_ENUM(NSInteger,XLAVPlayerStatus){
    XLAVPlayerBuffering = 0,
    XLAVPlayerPlaying,
    XLAVPlayerPausing
};

@interface XLAVPlayer : UIView

/**
 播放地址
 */
@property (nonatomic, copy) NSURL *playUrl;

/**
 播放
 */
-(void)play;

/**
 暂停
 */
-(void)pause;

/**
 停止
 */
-(void)stop;

/**
 单利模式
 */
+(XLAVPlayer*)sharePlayer;

/**
 展示方法
 */
-(void)showInView:(UIView*)view frame:(CGRect)frame back:(VoidBlock)back;


@end
