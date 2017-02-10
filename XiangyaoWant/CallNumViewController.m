//
//  CallNumViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-21.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "CallNumViewController.h"
#import "HujiaoViewController.h"
#import "AlterView.h"

@interface CallNumViewController ()

@end

@implementation CallNumViewController



-(void)viewWillAppear:(BOOL)animated{
    
    //当vcl在navigation里面时，要想改变状态栏文字为白色，就要改变navigationController的navigationBar为黑色背景
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [UIApplication sharedApplication].statusBarStyle        =UIStatusBarStyleLightContent;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [UIApplication sharedApplication].statusBarStyle        =UIStatusBarStyleLightContent;


    self.PhoneNumStr = [NSString new];
    _deletBtn.hidden=YES;
    
    //给清除按钮添加长按手势
    UILongPressGestureRecognizer *longPressGesture=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureClick:)];
    [_deletBtn addGestureRecognizer:longPressGesture];
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

//点击删号码
- (IBAction)deletBtnClick:(id)sender {
    

    self.NumLabel.text = [_PhoneNumStr substringToIndex:_PhoneNumStr.length - 1];
    self.PhoneNumStr = _NumLabel.text;
    if([self.PhoneNumStr isEqualToString:@""]){
        _deletBtn.hidden=YES;
    }
}

//清除按钮长按
-(void)longPressGestureClick:(UILongPressGestureRecognizer *)ges{
    
    if (ges.state == UIGestureRecognizerStateBegan) {
        _NumLabel.text=@"";
        self.PhoneNumStr=@"";
        if([self.PhoneNumStr isEqualToString:@""]){
            
            _deletBtn.hidden=YES;
        }
    }
}
//返回
- (IBAction)backBtn:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}
//通话按钮
- (IBAction)callBtnClick:(id)sender {
    
    HujiaoViewController *hujiaoVcl=[[HujiaoViewController alloc] init];
    [self presentViewController:hujiaoVcl animated:YES completion:nil
     ];
}
//点击拨号数字键事件
- (IBAction)NumberBtnClick:(UIButton *)Btn {
    
    
    //判断长度
    if ([_PhoneNumStr length]>11) {
        [AlterView AlterViewShowWithMesssge:@"请输入正确格式的手机号码"];
        self.PhoneNumStr=[_PhoneNumStr stringByAppendingString:@""];
    }
    else{
        NSArray *arr=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"*",@"0",@"#"];
        self.PhoneNumStr=[_PhoneNumStr stringByAppendingString:[NSString stringWithFormat:@"%@",arr[Btn.tag-10]]];
        self.NumLabel.text = _PhoneNumStr;
    }
    
    if(![self.PhoneNumStr isEqualToString:@""]){
        
        _deletBtn.hidden=NO;
    }

}
@end
