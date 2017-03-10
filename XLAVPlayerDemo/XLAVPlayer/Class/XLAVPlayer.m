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

+(XLAVPlayer *)sharePlayer{
    
    static XLAVPlayer *player = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[XLAVPlayer alloc] init];
    });
    return player;
}

-(instancetype)init{
    
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI{
    
    self.backgroundColor = [UIColor blackColor];
    
    _player = [[AVPlayer alloc] initWithPlayerItem:[AVPlayerItem new]];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.layer addSublayer:_playerLayer];
    
    _controlView = [[XLPlayerControlView alloc] init];
    [self addSubview:_controlView];
    
    
    __weak typeof (self)weekSelf = self;
    [_controlView addControlBlockPlay:^(BOOL play) {
        if (play) {
            [weekSelf play];
        }else{
            [weekSelf pause];
        }
    } seek:^(CGFloat value) {
        
    }];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updatePlayer) userInfo:nil repeats:true];
    [_timer setFireDate:[NSDate distantFuture]];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    _playerLayer.frame = self.layer.bounds;
    _controlView.frame = self.bounds;
    
    [self addTestBorderColor];
}

-(void)updatePlayer{
    
    _controlView.item = _player.currentItem;
    
    switch (_player.status) {
        case AVPlayerStatusUnknown:
            NSLog(@"加载中");
            break;
        case AVPlayerStatusReadyToPlay:
            NSLog(@"可以播放");
            break;
        case AVPlayerStatusFailed:
            NSLog(@"加载失败");
            break;
            
        default:
            break;
    }
}

-(void)showInView:(UIView *)view frame:(CGRect)frame{
    
    [_timer setFireDate:[NSDate date]];
    
    [view addSubview:self];
    
    self.frame = frame;
}

#pragma mark -
#pragma mark Setter&Getter

-(void)setPlayUrl:(NSURL *)playUrl{
    
    _playUrl = playUrl;
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:playUrl];
    [_player replaceCurrentItemWithPlayerItem:item];
}
#pragma mark -
#pragma mark 功能方法
-(void)play{

    [_player play];
}

-(void)pause{
    
    [_player pause];
}

-(void)stop{
    
    [_timer setFireDate:[NSDate distantFuture]];
    [_player pause];
}

#pragma mark -
#pragma mark 测试方法
-(void)addTestBorderColor{
    
    UIColor *borderColor = [UIColor blueColor];
    for (UIView *view1 in self.subviews) {
        view1.layer.borderWidth = 1.0f;
        view1.layer.borderColor = borderColor.CGColor;
        for (UIView *view2 in view1.subviews) {
            view2.layer.borderWidth = 1.0f;
            view2.layer.borderColor = borderColor.CGColor;
            for (UIView *view3 in view2.subviews) {
                view3.layer.borderWidth = 1.0f;
                view3.layer.borderColor = borderColor.CGColor;
            }
        }
    }
}

@end
