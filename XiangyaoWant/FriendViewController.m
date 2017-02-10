//
//  FriendViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-11.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "FriendViewController.h"
#import "SearchViewController.h"
#import "WantTableViewCell.h"
#import "qunzuViewController.h"
#import "peiduiViewController.h"
#import "ChuiYiChuiViewController.h"
#import "saoyisaoViewController.h"
#import <Masonry.h>
#import "TelephoneNumViewController.h"

@interface FriendViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    WantTableViewCell *cell;
}
@end

@implementation FriendViewController



-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.hidden=YES;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _tableview.userInteractionEnabled=YES;
    _tableview.contentInset=UIEdgeInsetsMake(83, 0, 0, 0);
    [_tableview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-48);
        make.top.equalTo(@99);
    }];

    //上方四个按钮
    NSArray *topBtnArr=@[@"群组",@"配对",@"吹一吹",@"扫一扫"];
    for (int i=0; i<4; i++) {
        UIButton *topBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        topBtn.frame=CGRectMake(20+i*(320/4-4), -76 , 51 , 73);
        topBtn.tag=10+i;
        [topBtn setImage:[UIImage imageNamed:topBtnArr[i]] forState:UIControlStateNormal];
        [topBtn addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tableview addSubview:topBtn];
    }
    
    //注册Xib
    [_tableview registerNib:[UINib nibWithNibName:@"WantTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
//每组多少列
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 12;
}

//每行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WantTableViewCell *acell = (WantTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return acell.frame.size.height;
}
//显示cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier=@"cell";
    cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[WantTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
    
}

//选定cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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


//搜索按钮事件
- (IBAction)searchBtnClick:(id)sender {
    
    NSLog(@"点击了搜索好友");
    SearchViewController *searchVcl=[[SearchViewController alloc] init];
    [searchVcl setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:searchVcl animated:YES completion:nil];
}

//群组吹一吹等事件
- (void)topBtnClick:(UIButton *)btn{
    
    switch (btn.tag) {
        case 10:{
            NSLog(@"群组");
            qunzuViewController *qunzuVcl=[[qunzuViewController alloc] init];
            UINavigationController *qunzuNcl=[[UINavigationController alloc] initWithRootViewController:qunzuVcl];
            qunzuVcl.navigationController.navigationBar.hidden=YES;
            [qunzuVcl setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
            [self presentViewController:qunzuNcl animated:YES completion:nil];
        }
            break;
        case 11:
            NSLog(@"配对");
            break;
        case 12:{
            NSLog(@"吹一吹");
            ChuiYiChuiViewController *chuiVcl=[[ChuiYiChuiViewController alloc] init];
            UINavigationController *chuiNcl=[[UINavigationController alloc] initWithRootViewController:chuiVcl];
            [chuiVcl setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
            chuiVcl.navigationController.navigationBar.hidden=YES;
            [self presentViewController:chuiNcl animated:YES completion:nil];
        }
            break;
        case 13:{
            NSLog(@"扫一扫");
        }
            break;
        default:
            break;
    }
}
//添加通讯录
- (IBAction)addBtnClick:(id)sender {
    TelephoneNumViewController *TelephoneNumVcl=[[TelephoneNumViewController alloc] init];
    UINavigationController *TelephoneNumNcl=[[UINavigationController alloc] initWithRootViewController:TelephoneNumVcl];
    TelephoneNumVcl.navigationController.navigationBar.hidden=YES;
    [TelephoneNumVcl setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:TelephoneNumNcl animated:YES completion:nil];
}


@end
