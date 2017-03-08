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

@property (nonatomic, copy) NSURL *playUrl;

-(void)play;

-(void)pause;

-(void)stop;

+(XLAVPlayer*)sharePlayer;

-(void)showInView:(UIView*)view frame:(CGRect)frame;

@end
