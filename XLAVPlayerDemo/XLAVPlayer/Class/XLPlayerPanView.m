//
//  XLPlayerPanView.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/13.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLPlayerPanView.h"

@interface XLPlayerPanView () {
    CGPoint _startPoint;
}
@end

@implementation XLPlayerPanView

-(instancetype)init {
    if (self = [super init]) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMethod:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)panMethod:(UIPanGestureRecognizer*)pan {
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self doPanChanged:pan];
        }
            break;
        case UIGestureRecognizerStateEnded:
            break;
        default:
            break;
    }
}

- (void)doPanChanged:(UIPanGestureRecognizer*)pan {
    
    if (CGPointEqualToPoint(_startPoint, CGPointZero)) {
        _startPoint = [pan locationInView:self];
        return;
    }
    CGPoint point = [pan locationInView:self];
    if (ABS(_startPoint.x - point.x) < ABS(_startPoint.y - point.y)) {
        NSLog(@"上下移动");
    }else{
        NSLog(@"左右移动");
    }
    _startPoint = point;
}

@end
