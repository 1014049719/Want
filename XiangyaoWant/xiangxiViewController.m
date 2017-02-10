//
//  xiangxiViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-14.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "xiangxiViewController.h"
#import <Masonry.h>
#import "topTableViewCell.h"
#import "bottomTableViewCell.h"
#import "CallNumViewController.h"

@interface xiangxiViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation xiangxiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.userInteractionEnabled=YES;
    _tableView.tableFooterView=[UIView new];
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(@60);
    }];
    
    
    //注册Xib
    [_tableView registerNib:[UINib nibWithNibName:@"topTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellTop"];
    [_tableView registerNib:[UINib nibWithNibName:@"bottomTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellBottom"];
}

//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
//每组多少列
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return 3;
    }
    return 2;
}

//每行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        topTableViewCell *cellTop = (topTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cellTop.frame.size.height;
    }
    
        bottomTableViewCell *cellBottom=(bottomTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cellBottom.frame.size.height;
}
//显示cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier1=@"cellTop";
    topTableViewCell *cellTop=[tableView dequeueReusableCellWithIdentifier:identifier1];
    if (cellTop==nil) {
        cellTop=[[topTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    
    static NSString *identifier2=@"cellBottom";
    bottomTableViewCell *cellBottom=[tableView dequeueReusableCellWithIdentifier:identifier2];
    if (cellBottom==nil) {
        cellBottom=[[bottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
    }
    
    NSArray *titleArr=@[@"置顶聊天",@"消息免打扰",@"聊天背景",@"清空聊天记录",@"举报"];
    cellBottom.titleLabel.text=titleArr[indexPath.row];
    if (indexPath.section==0) {
        return cellTop;
    }
    
    if (indexPath.section==1) {
        if (indexPath.row<2) {
            UISwitch *kaiguan=[[UISwitch alloc] initWithFrame:CGRectMake(250, 5, 30, 20)];
            [cellBottom.contentView addSubview:kaiguan];
        }
    }
    
    return cellBottom;
    
}

//选定cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//尾部索引
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2) {
        return 120;
    }
    return 5;
}
//头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    return view;
}
//尾部视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    UIView *footView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    footView.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    footView.userInteractionEnabled=YES;
    
    //加打电话发信息按钮
    if (section==2) {
        UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(80, 30, 68, 68);
        [btn1 setBackgroundImage:[UIImage imageNamed:@"打电话蓝"] forState:UIControlStateNormal];
        btn1.tag=100;
        btn1.userInteractionEnabled=YES;
        [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:btn1];
        [btn1 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(footView).offset(20);
            make.centerX.equalTo(footView).offset(-50);
            make.size.mas_equalTo(CGSizeMake(68, 68));
        }];

        UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn2 setBackgroundImage:[UIImage imageNamed:@"发信息绿"] forState:UIControlStateNormal];
        btn2.tag=101;
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:btn2];
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(btn1);
            make.centerX.equalTo(footView).offset(50);
            make.size.mas_equalTo(CGSizeMake(68, 68));
        }];
    }
    
    return footView;
}

//处理打电话发短信按钮事件
-(void)btnClick:(UIButton *)btn{

    switch (btn.tag) {
        case 100:{
            NSLog(@"打电话");
            CallNumViewController *callVcl=[[CallNumViewController alloc] init];
            UINavigationController *callNvc=[[UINavigationController alloc] initWithRootViewController:callVcl];
            callNvc.navigationBar.hidden=YES;
            [callVcl setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
            [self presentViewController:callNvc animated:YES completion:nil];
        }
            break;
        case 101:{
            NSLog(@"发短信");
            [self.navigationController popViewControllerAnimated:NO];
        }
            break;
        default:
            break;
    }
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
@end
