//
//  HujiaoViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-21.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "HujiaoViewController.h"

@interface HujiaoViewController ()

@end

@implementation HujiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];

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

//挂断
- (IBAction)GuaduanBtnClick:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
