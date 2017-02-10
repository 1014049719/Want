//
//  MySexViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-12.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "MySexViewController.h"
#import "MyAgeViewController.h"

@interface MySexViewController ()

@end

@implementation MySexViewController

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

//点击头像更换图片性别
- (IBAction)ImageBtnClick:(UIButton *)btn {
    
    NSString *sex;
    for (int i=100; i<102; i++) {
        UIButton *button=(UIButton *)[self.view viewWithTag:i];
        button.selected=NO;
    }
    btn.selected=YES;
    
    if(btn.tag==100 && btn.selected==YES){
        NSLog(@"点击了 选择性别 %ld",(long)btn.tag);
        [_maleBtn setBackgroundImage:[UIImage imageNamed:@"yans_03"] forState:UIControlStateSelected];
        sex = @"boy";
    }
    else if(btn.tag==101 && btn.selected==YES){
        NSLog(@"点击了 选择性别 %ld",(long)btn.tag);
        [_femaleBtn setBackgroundImage:[UIImage imageNamed:@"yans_06"] forState:UIControlStateSelected];
        sex = @"girl";
    }
    [[NSUserDefaults standardUserDefaults] setObject:sex forKey:@"sex"];

}

//上一步
- (IBAction)backBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//下一步
- (IBAction)nextBtnClick:(id)sender {
    
    MyAgeViewController *ageVcl=[[MyAgeViewController alloc] init];
    [self presentViewController:ageVcl animated:YES completion:nil];
}
@end
