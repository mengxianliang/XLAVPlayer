//
//  XLPlayerUtil.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLPlayerUtil.h"

@implementation XLPlayerUtil

+(NSString*)getTimeStringFromSecond:(CGFloat)second{
    
    NSString* timeStr = @"" ;
    int oneHour = 3600;
    NSTimeInterval time= second - 8*oneHour;
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = second < oneHour ? @"mm:ss" : @"HH:mm:ss";
    timeStr = [dateFormatter stringFromDate: detaildate];
    return timeStr;
}

//获取缓冲进度
+(CGFloat)getBufferTimeOf:(AVPlayerItem*)item{
    
    NSArray *loadedTimeRanges = [item loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];
    CGFloat startSeconds = CMTimeGetSeconds(timeRange.start);
    CGFloat durationSeconds = CMTimeGetSeconds(timeRange.duration);
    return startSeconds + durationSeconds;;
}

@end
