//
//  ViewController.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "ViewController.h"
#import "XLAVPlayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[XLAVPlayer sharePlayer] showInView:self.view frame:CGRectMake(0, 0, self.view.bounds.size.width, 250)];
    [XLAVPlayer sharePlayer].playUrl = [NSURL URLWithString:@"http://v.jxvdy.com/sendfile/w5bgP3A8JgiQQo5l0hvoNGE2H16WbN09X-ONHPq3P3C1BISgf7C-qVs6_c8oaw3zKScO78I--b0BGFBRxlpw13sf2e54QA"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
