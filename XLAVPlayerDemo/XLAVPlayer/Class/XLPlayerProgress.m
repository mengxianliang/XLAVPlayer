//
//  XLPlayerProgress.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLPlayerProgress.h"

@interface XLPlayerProgress ()
{
    UISlider *_bufferSlider;
    
    UISlider *_playTimeSlider;
}
@end

@implementation XLPlayerProgress

-(instancetype)init
{
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI
{
    _bufferSlider = [[UISlider alloc] init];
    [_bufferSlider setMinimumTrackTintColor:[UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1]];
    [_bufferSlider setMaximumTrackTintColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [_bufferSlider setThumbTintColor:[UIColor clearColor]];
    [self addSubview:_bufferSlider];
    
    _playTimeSlider = [[UISlider alloc] init];
    [_playTimeSlider setMinimumTrackTintColor:[UIColor colorWithRed:218/255.0f green:78/255.0f blue:78/255.0f alpha:1]];
    [_playTimeSlider setMaximumTrackTintColor:[UIColor clearColor]];
    [_playTimeSlider setThumbImage:[UIImage imageNamed:@"sliderThumImage"] forState:UIControlStateNormal];
    [self addSubview:_playTimeSlider];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _bufferSlider.frame = self.bounds;
    
    _playTimeSlider.frame = self.bounds;
}

-(void)setItem:(AVPlayerItem *)item{
    
    _item = item;
    
    CGFloat duration = CMTimeGetSeconds(item.duration);
    
    CGFloat playTime = CMTimeGetSeconds(item.currentTime);
    _playTimeSlider.value = playTime/duration;
    
    CGFloat buffer = [XLPlayerUtil getBufferTimeOf:item];
    _bufferSlider.value = buffer/duration;
}

@end
