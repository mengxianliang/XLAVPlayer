//
//  XLPlayerControlView.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLPlayerControlView.h"
#import "XLPlayerTopBar.h"
#import "XLPlayerBottomBar.h"

@interface XLPlayerControlView ()
{
    XLPlayerTopBar *_topBar;
    XLPlayerBottomBar *_bottomBar;
}
@end

@implementation XLPlayerControlView

-(instancetype)init
{
    if (self = [super init]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI
{
    
}


@end
