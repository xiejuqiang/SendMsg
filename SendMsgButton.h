//
//  SendMsgButton.h
//  EasyShopAutolayout
//
//  Created by xjq on 21/5/15.
//  Copyright (c) 2015年 medp. All rights reserved.
//

@protocol SendMsgDelegate <NSObject>

- (void)postToYourServeice;//请求网络

@end

#import <UIKit/UIKit.h>
#import <QuartzCore/CADisplayLink.h>

@interface SendMsgButton : NSObject
- (void)setInitView;
//timer
@property(nonatomic,strong)CADisplayLink *timer;
@property(nonatomic)NSInteger num;
@property(nonatomic,weak) id <SendMsgDelegate> delegate;
//UIButton
@property(nonatomic,strong)UIButton *sendMsgBtn;
@property(nonatomic)CGRect frame;

@end
