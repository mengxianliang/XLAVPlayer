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

@property (nonatomic, strong) AVPlayerItem *item;

@property (nonatomic ,assign) BOOL fullScreen;

-(void)addSeekBlock:(SeekBlock)finish;

-(void)addFullScreenBlock:(FullScreenBlock)fullScreen;

-(void)seekFinished;

@end
