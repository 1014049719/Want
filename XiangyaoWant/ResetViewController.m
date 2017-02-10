//
//  ResetViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-9.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "ResetViewController.h"
#import "xingxiangViewController.h"
#import <AFNetworking.h>


@interface ResetViewController ()

@end

@implementation ResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self creatUI];
  

}

-(void)creatUI{

    _submitBtn.layer.cornerRadius=6;
}
//上传数据
-(void)requestDataWithUlrStr:(NSString *)urlString{

    NSDictionary *dic=@{@"userName":@"18046712400",@"Password":@"199323",@"name":@"wth"};
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        NSLog(@"%@",responseObject);
                
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
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

//返回
- (IBAction)BackBtnClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
//退出键盘
- (IBAction)TextFieldEnd:(id)sender {
    
    [_PhoneNumTextFileld resignFirstResponder];
    [_yanzhengmaTextField resignFirstResponder];
    [_mimaTextFlied resignFirstResponder];
}
//下一步
- (IBAction)submitBtnClick:(id)sender {
    
    xingxiangViewController *MySexVcl=[[xingxiangViewController alloc] init];
//    [self requestDataWithUlrStr:registUrl];
    [self.navigationController pushViewController:MySexVcl animated:YES];
}
@end
