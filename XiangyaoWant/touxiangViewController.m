//
//  touxiangViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-21.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "touxiangViewController.h"
#import "TabbarController.h"
#import <Masonry.h>

@interface touxiangViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    BOOL _isOpen;
    NSMutableArray *_DataArr;
    UIPickerView *_pickerView;
}
@end

@implementation touxiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //数据源
    _DataArr=[[NSMutableArray alloc] init];
    //开关
    _isOpen=NO;
    
    [_jinruWantbtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_offset(CGSizeMake(195, 32));
        make.bottom.equalTo(self.view).offset(-10);
    }];
}
//显示年龄PickerView
-(void)xianshiAgePickerView{

    _pickerView=[[UIPickerView alloc] initWithFrame:CGRectMake(10, 100, 320, 162)];
    [self.view addSubview:_pickerView];
    [_pickerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_offset(CGSizeMake(320, 110));
        make.bottom.equalTo(_jinruWantbtn).offset(-50);

    }];
    
    _pickerView.delegate=self;
    _pickerView.dataSource=self;
    
    //添加数据源
    for (int i=0; i<=120; i++) {
        [_DataArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    //设定默认值
    [_pickerView selectRow:20 inComponent:0 animated:YES];
    
}

//返回多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}
//返回每列多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _DataArr.count;
}

//自定义显示内容
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 40)];
    label.text=[_DataArr objectAtIndex:row];
    label.textColor=COLOR(48, 142, 244);
    label.font = [UIFont systemFontOfSize:25];
    
    UIView *myView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    [myView addSubview:label];
    return myView;
}

//显示当前滚动停止内容
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _ageLabel.text=[_DataArr objectAtIndex:row];
    _ageLabel.font=[UIFont systemFontOfSize:18];
    NSLog(@"滚动到了 %@ 岁",_ageLabel.text);
    
}

//高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30;
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

//选择年龄
- (IBAction)ageBtnClick:(id)sender {
    
    if (_isOpen==NO) {
        [self xianshiAgePickerView];
        [UIView animateWithDuration:0.2 animations:^{
            _xialaView.transform=CGAffineTransformMakeRotation(M_PI);
        }];
        _isOpen=YES;

    }
    else if (_isOpen==YES){
    
        [_pickerView removeFromSuperview];
        [UIView animateWithDuration:0.2 animations:^{
            _xialaView.transform=CGAffineTransformMakeRotation(0);
        }];
        _isOpen=NO;

    }
}

//注册完成 进入主界面
- (IBAction)jinruWantBtnClick:(id)sender {
    
    TabbarController *tbc=[[TabbarController alloc]init];
    [self.navigationController pushViewController:tbc animated:NO];
}
//退出键盘
- (IBAction)textFleldEnd:(id)sender {
    
    [_nichengTextField resignFirstResponder];
}

@end
