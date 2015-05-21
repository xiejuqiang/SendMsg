# SendMsg
短信发送倒计时

使用方法

_sendMsg = [[SendMsgButton alloc] init];

_sendMsg.delegate = self;

_sendMsg.frame = CGRectMake(10, 10, 150, 40);

[_sendMsg setInitView];

[self.view addSubview:_sendMsg.sendMsgBtn];
