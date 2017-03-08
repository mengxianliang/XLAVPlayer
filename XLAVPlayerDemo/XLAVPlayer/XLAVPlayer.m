//
//  XLAVPlayer.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLAVPlayer.h"
#import "XLPlayerControlView.h"


@interface XLAVPlayer ()
{
    AVPlayer *_player;
    AVPlayerLayer *_playerLayer;
    NSTimer *_timer;
    
    XLPlayerControlView *_controlView;
}
@end

@implementation XLAVPlayer

+(XLAVPlayer *)sharePlayer
{
    static XLAVPlayer *player = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[XLAVPlayer alloc] init];
    });
    return player;
}

-(instancetype)init
{
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI
{
    _player = [[AVPlayer alloc] initWithPlayerItem:[AVPlayerItem new]];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.layer addSublayer:_playerLayer];
    
    _controlView = [[XLPlayerControlView alloc] init];
    
    [self addSubview:_controlView];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updatePlayer) userInfo:nil repeats:true];
    [_timer setFireDate:[NSDate distantFuture]];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _playerLayer.frame = self.layer.bounds;
    _controlView.frame = self.bounds;
}

-(void)updatePlayer
{
    
}

-(void)showInView:(UIView *)view frame:(CGRect)frame
{
    [_timer setFireDate:[NSDate date]];
    
    [view addSubview:self];
    
    self.frame = frame;
}

#pragma mark -
#pragma mark Setter&Getter

-(void)setPlayUrl:(NSURL *)playUrl
{
    _playUrl = playUrl;
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:playUrl];
    [_player replaceCurrentItemWithPlayerItem:item];
    [_player play];
}
#pragma mark -
#pragma mark 功能方法
-(void)play
{
    [_player play];
}

-(void)pause
{
    [_player pause];
}

-(void)stop
{
    [_timer setFireDate:[NSDate distantFuture]];
    [_player pause];
}

@end
