//
//  ShowPlayerViewController.m
//  XLAVPlayerDemo
//
//  Created by MengXianLiang on 2017/3/13.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "ShowPlayerViewController.h"
#import "XLAVPlayer.h"

@interface ShowPlayerViewController ()

@end



@implementation ShowPlayerViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true animated:true];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:false animated:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[XLAVPlayer sharePlayer] showInView:self.view frame:CGRectMake(0, 0, self.view.bounds.size.width, 250) back:^{
        [self.navigationController popViewControllerAnimated:true];
    }];
    [XLAVPlayer sharePlayer].playUrl = [NSURL URLWithString:@"http://v.jxvdy.com/sendfile/w5bgP3A8JgiQQo5l0hvoNGE2H16WbN09X-ONHPq3P3C1BISgf7C-qVs6_c8oaw3zKScO78I--b0BGFBRxlpw13sf2e54QA"];
}

- (BOOL)prefersStatusBarHidden {
    return true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
