//
//  MineViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-11.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "MineViewController.h"
#import "TouXiangTableViewCell.h"
#import "ZhongjianTableViewCell.h"
#import "LogoutTableViewCell.h"
#import "MyViewController.h"
#import "ZiLiaoViewController.h"
#import "TabbarController.h"
#import <Masonry.h>

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.hidden=YES;

    _tableView.dataSource=self;
    _tableView.delegate=self;
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@59);
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-48);
    }];
   
    //注册Xib
    [_tableView registerNib:[UINib nibWithNibName:@"TouXiangTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    [_tableView registerNib:[UINib nibWithNibName:@"ZhongjianTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    [_tableView registerNib:[UINib nibWithNibName:@"LogoutTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell3"];
}

//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
//每组多少列
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0 || section==2) {
        return 1;
    }
    return 6;
}
//每行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        return 60;
    }
    else if (indexPath.section==2){
        return 45;
    }
    
    return 40;
}
//显示cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier1=@"cell1";
    TouXiangTableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:identifier1];
    if (cell1==nil) {
        cell1=[[TouXiangTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    
    static NSString *identifier2=@"cell2";
    ZhongjianTableViewCell *cell2=[tableView dequeueReusableCellWithIdentifier:identifier2];
    if (cell2==nil) {
        cell2=[[ZhongjianTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
    }
    
    static NSString *identifier3=@"cell3";
    LogoutTableViewCell *cell3=[tableView dequeueReusableCellWithIdentifier:identifier3];
    if (cell3==nil) {
        cell3=[[LogoutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier3];
    }
    
    if (indexPath.section==0) {
        return cell1;
    }
    else if (indexPath.section==2){
        return cell3;
    }
    
    NSArray *imageArr1=@[@"个人资料",@"二维码",@"账户与安全",@"聊天记录存储",@"清空聊天记录",@"关于想要Want"];
    cell2.Label.text=[imageArr1 objectAtIndex:indexPath.row];
    return cell2;
}
//尾部索引
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section==0) {
        return 20;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10;
}
//头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    return view;
}
//尾部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    return view;
}

//选定cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //点击后取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if (indexPath.section==0) {
        MyViewController *MyVcl=[[MyViewController alloc] init];
        UINavigationController *myNcl=[[UINavigationController alloc] initWithRootViewController:MyVcl];
        myNcl.navigationBar.hidden=YES;
        [MyVcl setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentViewController:myNcl animated:YES completion:nil];
        
    }
    else if (indexPath.section==1){
    
        switch (indexPath.row) {
            case 0:
            {
                ZiLiaoViewController *ziliaoVcl=[[ZiLiaoViewController alloc] init];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"yincangTabbar" object:nil];
                [self.navigationController pushViewController:ziliaoVcl animated:YES];
            }
                break;
            case 1:
            {
            
            }
                break;
            case 2:
            {
               
            }
                break;
            case 3:
            {
            
            }
                break;
            default:
                break;
        }
    }
    else if (indexPath.section==2){
    
    }
}

-(void)viewWillDisappear:(BOOL)animated

{
    
    [super viewWillDisappear:animated];
//
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    
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
