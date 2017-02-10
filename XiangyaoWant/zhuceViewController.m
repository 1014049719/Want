//
//  zhuceViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-23.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "zhuceViewController.h"
#import "xingxiangViewController.h"

@interface zhuceViewController ()

@end

@implementation zhuceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //标题传值
    _phonrNumchuanzhiLabel.text=self.NumStr;
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
- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//下一步
- (IBAction)nextBtnClick:(id)sender {
    
    xingxiangViewController *tbc=[[xingxiangViewController alloc]init];
    [self.navigationController pushViewController:tbc animated:NO];
}
//收回键盘
- (IBAction)textFieldEnd:(id)sender {
    
    [_haomaTextField resignFirstResponder];
    [_yanzhengmaTextField resignFirstResponder];
    [_xinmimaTextField resignFirstResponder];
}
@end
