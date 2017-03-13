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

@property (assign,nonatomic) BOOL isFullScreen;

@property (strong, nonatomic) AVPlayerItem *item;

-(void)addControlBlockPlay:(PlayBlock)playBlock seek:(SeekBlock)seekBlock back:(VoidBlock)back;

-(void)seekFinished;

@end
