//
//  XLPlayerUtil.h
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef void(^PlayBlock)(BOOL play);

typedef void(^FullScreenBlock)(BOOL fullScreen);

typedef void(^SeekBlock)(CGFloat value);

typedef void(^VoidBlock)(void);

@interface XLPlayerUtil : NSObject

/**
 秒数 转成 时分秒格式的字符串
 */
+(NSString*)getTimeStringFromSecond:(CGFloat)second;

/**
 获取缓冲时间
 */
+(CGFloat)getBufferTimeOf:(AVPlayerItem*)item;

@end
