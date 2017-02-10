//
//  ZiLiaoViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-24.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "ZiLiaoViewController.h"
#import "OneImageTableViewCell.h"
#import "TextTableViewCell.h"
#import "qianMingViewController.h"

@interface ZiLiaoViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZiLiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.contentInset=UIEdgeInsetsMake(10, 0, 0, 0);
    
    //注册xib
    [_tableView registerNib:[UINib nibWithNibName:@"OneImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    [_tableView registerNib:[UINib nibWithNibName:@"TextTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==1) {
        return 5;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier1=@"cell1";
    OneImageTableViewCell *oneCell=[tableView dequeueReusableCellWithIdentifier:identifier1];
    if (oneCell==nil) {
        oneCell=[[OneImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    
    static NSString *identifier2=@"cell2";
    TextTableViewCell *textCell=[tableView dequeueReusableCellWithIdentifier:identifier2];
    if (textCell==nil) {
        textCell=[[TextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
    }

    if (indexPath.section==0) {
        return oneCell;
    }

    NSArray *labelLeftArr=@[@"昵称",@"性别",@"年龄",@"账号",@"签名"];
    textCell.leftLabel.text=labelLeftArr[indexPath.row];
    return textCell;
}
//选择cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0){
        return 47;
    }
    return 40;
}

//尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}
//尾部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    return view;
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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"xianshiTabbar" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
