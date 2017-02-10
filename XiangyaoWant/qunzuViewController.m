//
//  qunzuViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-13.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "qunzuViewController.h"

@interface qunzuViewController ()

@end

@implementation qunzuViewController

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

//返回
- (IBAction)backBtnClick:(id)sender {

     [self dismissViewControllerAnimated:NO completion:nil];
}
@end
