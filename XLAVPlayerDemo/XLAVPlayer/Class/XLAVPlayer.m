//
//  XLAVPlayer.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLAVPlayer.h"
#import "XLPlayerControlView.h"


@interface XLAVPlayer () {
    
    AVPlayer *_player;
    
    AVPlayerLayer *_playerLayer;
    
    NSTimer *_timer;
    
    XLPlayerControlView *_controlView;
    
    VoidBlock _backBlock;
    
    CGRect _originalRect;
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
        
        [self buildData];
    }
    return self;
}

-(void)showInView:(UIView*)view frame:(CGRect)frame back:(VoidBlock)back{
    
    [_timer setFireDate:[NSDate date]];
    
    [view addSubview:self];
    
    self.frame = frame;
    
    _originalRect = frame;
    
    _backBlock = back;
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
        [weekSelf seekToPercent:value];
    } fullScreen:^(BOOL fullScreen) {
        [weekSelf goToFullScreen:fullScreen];
    } back:^{
        [weekSelf back];
    }];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updatePlayer) userInfo:nil repeats:true];
    [_timer setFireDate:[NSDate distantFuture]];
}


- (void)buildData {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    _playerLayer.frame = self.layer.bounds;
    
    _controlView.frame = self.bounds;
    
    [self addTestBorderColor];
}

-(void)updatePlayer{
    
    _controlView.item = _player.currentItem;
    
    
    switch (_player.status) {
        case AVPlayerStatusUnknown:
//            NSLog(@"加载中");
            break;
        case AVPlayerStatusReadyToPlay:
//            NSLog(@"可以播放");
            break;
        case AVPlayerStatusFailed:
//            NSLog(@"加载失败");
            break;
            
        default:
            break;
    }
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

-(void)seekToPercent:(CGFloat)percent
{
    CGFloat second = CMTimeGetSeconds(_player.currentItem.duration) * percent;
    [_player seekToTime:CMTimeMakeWithSeconds(second, 1) completionHandler:^(BOOL finished) {
        [_controlView seekFinished];
    }];
}

-(void)back{
    _backBlock();
    [self stop];
}

#pragma mark -
#pragma mark 旋转方法
-(void)orientationChanged:(NSNotification*)notification{
    UIDeviceOrientation currentOrientation = [[UIDevice currentDevice] orientation];
    if (currentOrientation == UIDeviceOrientationPortrait) {
        _controlView.fullScreen = false;
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = _originalRect;
        }];
    }else if (currentOrientation == UIDeviceOrientationLandscapeLeft || currentOrientation == UIDeviceOrientationLandscapeRight){
        _controlView.fullScreen = true;
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = [UIScreen mainScreen].bounds;
        }];
    }
}

-(void)goToFullScreen:(BOOL)fullScreen{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation  setTarget:[UIDevice currentDevice]];
        int val  =  fullScreen ? UIInterfaceOrientationLandscapeRight : UIInterfaceOrientationPortrait ;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
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
