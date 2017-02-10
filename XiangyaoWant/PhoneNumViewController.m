//
//  PhoneNumViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-6.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "PhoneNumViewController.h"
#import "LoginViewController.h"
#import "SMS_SDK/SMS_SDK.h"
#import "zhuceViewController.h"


@interface PhoneNumViewController ()<UIAlertViewDelegate>

@end

@implementation PhoneNumViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	
	_NextBtn.layer.cornerRadius=6;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

}



- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//收回键盘
- (IBAction)TextFieldEnd:(id)sender {
	[_NumTextField resignFirstResponder];
}

//下一步
- (IBAction)NextBtnClick:(id)sender {
//	if (![self isValidPhoneNumber:_NumTextField.text]) {
//		UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil)
//																									message:NSLocalizedString(@"errorphonenumber", nil)
//																								 delegate:self
//																				cancelButtonTitle:NSLocalizedString(@"sure", nil)
//																				otherButtonTitles:nil, nil];
//		[alert show];
//		return;
//	}
//	
//	NSString* str=[NSString stringWithFormat:@"%@:\n%@", NSLocalizedString(@"willsendthecodeto", nil), self.NumTextField.text];
//	
//	UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"surephonenumber", nil)
//																								message:str delegate:self
//																			cancelButtonTitle:NSLocalizedString(@"cancel", nil)
//																			otherButtonTitles:NSLocalizedString(@"sure", nil), nil];
//	[alert show];
	
    //测试用（上线打开上面）
    zhuceViewController *zhuceVcl=[[zhuceViewController alloc] init];
    zhuceVcl.NumStr=_NumTextField.text;
    [self.navigationController pushViewController:zhuceVcl animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (1==buttonIndex)
	{
		LoginViewController* verify=[[LoginViewController alloc] init];
		
		[SMS_SDK getVerificationCodeBySMSWithPhone:_NumTextField.text
																					zone:@"86"
																				result:^(SMS_SDKError *error)
		 {
			 if (!error)
			 {
				 [self presentViewController:verify animated:YES completion:^{
					 ;
				 }];
			 }
			 else
			 {
				 UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"发送失败"
																											 message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
																											delegate:self
																						 cancelButtonTitle:@"确定"
																						 otherButtonTitles:nil, nil];
				 [alert show];
			 }
			 
		 }];
	}
}
//检测手机号码
- (BOOL)isValidPhoneNumber:(NSString *)number {
	NSString *phoneRule = @"^1(3|5|7|8|4)\\d{9}";
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRule];
	return ([pred evaluateWithObject:_NumTextField.text] && (_NumTextField.text.length == 11));
}
@end
