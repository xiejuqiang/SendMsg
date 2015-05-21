//
//  SendMsgButton.m
//  EasyShopAutolayout
//
//  Created by xjq on 21/5/15.
//  Copyright (c) 2015年 medp. All rights reserved.
//

#import "SendMsgButton.h"

//setup
#define NormalColor COLOR(208, 49, 54, 1.0)
#define CornerRadius 3.0
#define NormalTitle @"发送短信"
#define DisableTitle @"秒后可重发"
#define reSendTitle @"重新发送"
#define NormalTitleColor [UIColor whiteColor]
#define TitleFont 14.0

@implementation SendMsgButton
- (void)setInitView
{

    self.sendMsgBtn = [[UIButton alloc] initWithFrame:self.frame];
    self.sendMsgBtn.titleLabel.font = [UIFont systemFontOfSize:TitleFont];
    self.sendMsgBtn.layer.cornerRadius = CornerRadius;
    self.sendMsgBtn.backgroundColor = NormalColor;
    [self.sendMsgBtn setTitle:NormalTitle forState:UIControlStateNormal];
    [self.sendMsgBtn setTitleColor:NormalTitleColor forState:UIControlStateNormal];
    [self.sendMsgBtn addTarget:self action:@selector(sendMsgClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)sendMsgClick:(UIButton *)btn
{
    self.num = 60;
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitle:[NSString stringWithFormat:@"%ld%@",(long)self.num,DisableTitle] forState:UIControlStateNormal];
    btn.enabled = NO;
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeNum)];
    self.timer.frameInterval = 60;
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [self.delegate postToYourServeice];
    
}

- (void)changeNum
{
    
    self.num--;
    if (self.num == -1) {
        self.sendMsgBtn.enabled = YES;
        self.sendMsgBtn.backgroundColor = NormalColor;
        [self.sendMsgBtn setTitle:reSendTitle forState:UIControlStateNormal];
        [self.sendMsgBtn setTitleColor:NormalTitleColor forState:UIControlStateNormal];
        [self.timer invalidate];
        self.timer = nil;
        return;
        
    }
    [self.sendMsgBtn setTitle:[NSString stringWithFormat:@"%ld%@",(long)self.num,DisableTitle] forState:UIControlStateNormal];
    self.sendMsgBtn.backgroundColor = [UIColor lightGrayColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
