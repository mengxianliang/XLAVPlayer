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

//Second ---> timeString
+(NSString*)getTimeStringFromSecond:(CGFloat)second;

//get bufferTime
+(CGFloat)getBufferTimeOf:(AVPlayerItem*)item;

@end
