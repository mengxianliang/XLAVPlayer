//
//  XLPlayerBottomBar.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLPlayerBottomBar.h"
#import "XLPlayerProgress.h"

@interface XLPlayerBottomBar ()
{
    UILabel *_playTimeLabel;
    UILabel *_totalTimeLabel;
    UIButton *_fullScreenButton;
    
    XLPlayerProgress *_progress;
}
@end

@implementation XLPlayerBottomBar

- (instancetype)init {
    
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    
    _playTimeLabel = [[UILabel alloc] init];
    _playTimeLabel.textAlignment = NSTextAlignmentCenter;
    _playTimeLabel.textColor = [UIColor whiteColor];
    _playTimeLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_playTimeLabel];
    
    _progress = [[XLPlayerProgress alloc] init];
    [self addSubview:_progress];
    
    _totalTimeLabel = [[UILabel alloc] init];
    _totalTimeLabel.textAlignment = NSTextAlignmentCenter;
    _totalTimeLabel.textColor = [UIColor whiteColor];
    _totalTimeLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_totalTimeLabel];
    
    _fullScreenButton = [[UIButton alloc] init];
    [_fullScreenButton setImage:[UIImage imageNamed:@"goToFullScreen"] forState:UIControlStateNormal];
    [_fullScreenButton setImage:[UIImage imageNamed:@"existFullScreen"] forState:UIControlStateSelected];
    [_fullScreenButton setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self addSubview:_fullScreenButton];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat margin = 5.0f;
    
    CGFloat height = self.bounds.size.height - 2*margin;
    CGFloat labelWidth = 60.0f;
    CGFloat btnWidth = height;
    CGFloat progressWidth = self.bounds.size.width - 5*margin - 2*labelWidth - btnWidth;
    
    _playTimeLabel.frame = CGRectMake(margin, margin, labelWidth, height);
    
    _progress.frame = CGRectMake(CGRectGetMaxX(_playTimeLabel.frame) + margin, margin, progressWidth, height);
    
    _totalTimeLabel.frame = CGRectMake(CGRectGetMaxX(_progress.frame) + margin, margin, labelWidth, height);
    
    _fullScreenButton.frame = CGRectMake(CGRectGetMaxX(_totalTimeLabel.frame) + margin, margin, btnWidth, height);
}

- (void)setItem:(AVPlayerItem *)item {
    _item = item;
    
    CGFloat duration = CMTimeGetSeconds(item.duration);
    
    if (isnan(duration)) {
        _playTimeLabel.text = @"00:00";
        _totalTimeLabel.text = @"00:00";
        return;
    }
    
    if (_progress.seeking) {return;}
    
    _progress.item = item;
    
    _playTimeLabel.text = [XLPlayerUtil getTimeStringFromSecond:CMTimeGetSeconds(item.currentTime)];
    
    _totalTimeLabel.text = [XLPlayerUtil getTimeStringFromSecond:duration];
}

- (void)addSeekBlock:(SeekBlock)finish {
    //更新播放时间
    [_progress addSeekBlockSeeking:^(CGFloat value) {
        CGFloat duration = CMTimeGetSeconds(_item.duration);
        CGFloat playTime = duration * value;
        _playTimeLabel.text = [XLPlayerUtil getTimeStringFromSecond:playTime];
    } finished:finish];
}

-(void)goToFullScreen:(UIButton*)button{
    button.selected = !button.selected;
}

- (void)seekFinished {
    _progress.seeking = false;
}

@end
