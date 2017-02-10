//
//  LoginViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-9.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "LoginViewController.h"
#import "ResetViewController.h"
#import "TabbarController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _phonrNumchuanzhiLabel.text=self.NumStr;
    [self creatUI];
}

-(void)creatUI{

    _LoginBtn.layer.cornerRadius=6;
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

//返回
- (IBAction)BackBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
//忘记密码
- (IBAction)ForgetBtnClick:(id)sender {
    
    ResetViewController *resetVCL=[[ResetViewController alloc] init];
    [self.navigationController pushViewController:resetVCL animated:YES];
}
//登录
- (IBAction)loginBtnClick:(id)sender {
    
    TabbarController *tbc=[[TabbarController alloc]init];
    [self.navigationController pushViewController:tbc animated:NO];
    
}
//退出键盘
-(IBAction)TextFieldEnd:(id)sender{

    [_mimaTextField resignFirstResponder];
}
@end
