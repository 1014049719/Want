//
//  liaotianViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-14.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "liaotianViewController.h"
#import "xiangxiViewController.h"

@interface liaotianViewController ()

@end

@implementation liaotianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

//详细资料
- (IBAction)xiangxiziliaoBtn:(id)sender {

    xiangxiViewController *xiangxiVcl=[[xiangxiViewController alloc] init];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"yincangTabbar" object:nil];
    [self.navigationController pushViewController:xiangxiVcl animated:YES];
}
//返回
- (IBAction)backBtnClick:(id)sender {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"xianshiTabbar" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
