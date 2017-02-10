//
//  xingxiangViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-21.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "xingxiangViewController.h"
#import "touxiangViewController.h"
#import <Masonry.h>

@interface xingxiangViewController ()

@end

@implementation xingxiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_BackgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_offset(CGSizeMake(231, 46));
        make.bottom.equalTo(self.view).offset(-10);
    }];
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

//上一步
- (IBAction)backBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
//下一步
- (IBAction)nextBtnClick:(id)sender {
    
    touxiangViewController *touxiangVcl=[[touxiangViewController alloc] init];
    [self.navigationController pushViewController:touxiangVcl animated:YES];
}
@end
