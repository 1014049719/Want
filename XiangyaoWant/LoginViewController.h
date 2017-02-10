//
//  LoginViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-9.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong,nonatomic)NSString *NumStr;
@property (strong, nonatomic) IBOutlet UILabel *phonrNumchuanzhiLabel;

@property (strong, nonatomic) IBOutlet UIButton *LoginBtn;
@property (strong, nonatomic) IBOutlet UITextField *mimaTextField;

- (IBAction)BackBtnClick:(id)sender;
- (IBAction)ForgetBtnClick:(id)sender;
- (IBAction)loginBtnClick:(id)sender;

-(IBAction)TextFieldEnd:(id)sender;
@end
