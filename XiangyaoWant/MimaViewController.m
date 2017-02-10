//
//  MimaViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-6.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "MimaViewController.h"
#import "SMS_SDK/SMS_SDK.h"
#import "MySexViewController.h"

@interface MimaViewController () {
	NSString* _phone;
	int _state;
	NSMutableData* _data;
	NSString* _localVerifyCode;
	
	NSString* _appKey;
	NSString* _appSecret;
	NSString* _duid;
	NSString* _token;
	NSString* _localPhoneNumber;
	
	NSString* _localZoneNumber;
	NSMutableArray* _addressBookTemp;
	NSString* _contactkey;
	SMS_UserInfo* _localUser;
	
	NSTimer* _timer1;
	NSTimer* _timer2;
	NSTimer* _timer3;
	
	UIAlertView* _alert1;
	UIAlertView* _alert2;
	UIAlertView* _alert3;
	
	UIAlertView *_tryVoiceCallAlertView;
}

@end

static int count = 0;

@implementation MimaViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_enterBtn.layer.cornerRadius=6;
	
	[self startToCount];
}
//开始计时
- (void)startToCount {
	[_timer1 invalidate];
	[_timer2 invalidate];
	[self.repeatSMSBtn setTitle:nil forState:UIControlStateNormal];
	self.repeatSMSBtn.enabled = NO;
	self.timeLabel.hidden = NO;
	count = 0;
	self.timeLabel.text = NSLocalizedString(@"timelabel", nil);
	NSTimer* timer=[NSTimer scheduledTimerWithTimeInterval:60
																									target:self
																								selector:@selector(showRepeatButton)
																								userInfo:nil
																								 repeats:YES];
	
	NSTimer* timer2=[NSTimer scheduledTimerWithTimeInterval:1
																									 target:self
																								 selector:@selector(updateTime)
																								 userInfo:nil
																									repeats:YES];
	_timer1 = timer;
	_timer2 = timer2;
}
//更新时间
- (void)updateTime {
	count++;
	if (count>=60)
	{
		[_timer2 invalidate];
		return;
	}
	self.timeLabel.text = [NSString stringWithFormat:@"%@(%i)%@",NSLocalizedString(@"timelablemsg", nil),60-count,NSLocalizedString(@"second", nil)];
	
	//添加 收听语音验证码
	//	if (count == 30)
	//	{
	//		if (_voiceCallMsgLabel.hidden)
	//		{
	//			_voiceCallMsgLabel.hidden = NO;
	//		}
	//
	//		if (_voiceCallButton.hidden)
	//		{
	//			_voiceCallButton.hidden = NO;
	//		}
	//	}
}

//60秒后显示“重新获取”按钮
-(void)showRepeatButton {
	[_timer1 invalidate];
	self.timeLabel.hidden = YES;
	[self.repeatSMSBtn setTitle:NSLocalizedString(@"repeatsms", nil) forState:UIControlStateNormal];
	self.repeatSMSBtn.enabled = YES;
	return;
}

//返回
- (IBAction)BackBtnClick:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}
//重新获取
- (IBAction)repeatSMS:(id)sender {
	[self startToCount];
}

//收回键盘
-(void)textFiledReturnEditing:(id)sender {
	[sender resignFirstResponder];
}
//选择类型
- (IBAction)OptionClick:(id)sender {
	
	NSLog(@"点击了 选择");
}
//完成
- (IBAction)submit:(id)sender {
	//验证号码
//	[self.view endEditing:YES];
//	
//	if(self.verifyCodeField.text.length != 4) {
//		UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil)
//																									message:NSLocalizedString(@"verifycodeformaterror", nil)
//																								 delegate:self
//																				cancelButtonTitle:NSLocalizedString(@"sure", nil)
//																				otherButtonTitles:nil, nil];
//		[alert show];
//	}
//	else
//	{
//		//[[SMS_SDK sharedInstance] commitVerifyCode:self.verifyCodeField.text];
//		NSLog(@"验证");
//		[SMS_SDK commitVerifyCode:self.verifyCodeField.text result:^(enum SMS_ResponseState state) {
//			if (1==state)
//			{
//				NSLog(@"验证成功");
//				UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"verifycoderighttitle", nil)
//																											message:[NSString stringWithFormat:NSLocalizedString(@"verifycoderightmsg", nil)]
//																										 delegate:self
//																						cancelButtonTitle:NSLocalizedString(@"sure", nil)
//																						otherButtonTitles:nil, nil];
//				[alert show];
//				_alert3 = alert;
//			}
//			else if(0==state)
//			{
//				NSLog(@"验证失败");
//				NSString* str=[NSString stringWithFormat:NSLocalizedString(@"verifycodeerrormsg", nil)];
//				UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"verifycodeerrortitle", nil)
//																											message:str
//																										 delegate:self
//																						cancelButtonTitle:NSLocalizedString(@"sure", nil)
//																						otherButtonTitles:nil, nil];
//				[alert show];
//			}
//		}];
//	}
    
    //调试用
    MySexViewController *MySexVcl=[[MySexViewController alloc] init];
    [self presentViewController:MySexVcl animated:YES completion:nil];
}

//退出时使计时器失效
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[_timer1 invalidate];
	[_timer2 invalidate];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}
@end
