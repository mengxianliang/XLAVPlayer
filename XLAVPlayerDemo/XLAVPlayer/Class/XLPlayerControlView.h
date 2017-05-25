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

@property (nonatomic, assign) BOOL fullScreen;

@property (nonatomic, strong) AVPlayerItem *item;

-(void)addControlBlockPlay:(PlayBlock)playBlock seek:(SeekBlock)seekBlock fullScreen:(FullScreenBlock)fullScreenBlock back:(VoidBlock)back;



-(void)seekFinished;

@end
