//
//  MyAgeViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-12.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "MyAgeViewController.h"
#import "TabbarController.h"

@interface MyAgeViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSMutableArray *dataArr;
}
@end

@implementation MyAgeViewController

-(void)viewWillAppear:(BOOL)animated{

    //设定默认值
        [_PickerView selectRow:20 inComponent:0 animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //更换性别图片
    NSString *sex = [[NSUserDefaults standardUserDefaults] objectForKey:@"sex"];
    NSLog(@"%@", sex);
    if ([sex isEqualToString:@"boy"]) {
        [_sexImageView setImage:[UIImage imageNamed:@"Sex_boy"]];
    }
    else if([sex isEqualToString:@"girl"]){
        [_sexImageView setImage:[UIImage imageNamed:@"Sex_girl"]];
    }
    
    //数据源
    dataArr=[[NSMutableArray alloc] init];
    _PickerView.delegate=self;
    _PickerView.dataSource=self;
    
    //添加数据源
    for (int i=0; i<=120; i++) {
        [dataArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    NSLog(@"%lu",(unsigned long)dataArr.count);
    
}

//返回多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}
//返回每列多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return dataArr.count;
}

//自定义显示内容
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 40)];
    label.text=[dataArr objectAtIndex:row];
    label.textColor=COLOR(48, 142, 244);
    label.font = [UIFont systemFontOfSize:25];
    
    UIView *myView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    [myView addSubview:label];
    return myView;
}

//显示当前滚动停止内容
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    NSLog(@"滚动到了 %@ 岁",[dataArr objectAtIndex:row]);
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

- (IBAction)BackBtnClick:(id)sender {
   
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)NextBtnClick:(id)sender {
    
    TabbarController *tabVcl=[[TabbarController alloc] init];
    [self presentViewController:tabVcl animated:YES completion:nil];
}
@end
