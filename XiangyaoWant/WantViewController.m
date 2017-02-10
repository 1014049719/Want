//
//  WantViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-11.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "WantViewController.h"

@interface WantViewController ()

@end

@implementation WantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.hidden=YES;
    
     [_mapWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://map.baidu.com"]]];
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


@end
