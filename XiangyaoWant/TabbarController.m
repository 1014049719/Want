//
//  TabbarController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-10.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "TabbarController.h"
#import "WantViewController.h"
#import "ChatViewController.h"
#import "FriendViewController.h"
#import "MineViewController.h"
#import "CallNumViewController.h"
#import "WTHButton.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
	//隐藏系统tabbar
	self.tabBar.hidden = YES;
	//自定义tabbar
	_tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-49, 320, 49)];
	_tabbarView.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:_tabbarView];
    
    //隐藏和显示通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidenTabbar) name:@"yincangTabbar" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xianshiTabbar) name:@"xianshiTabbar" object:nil];
    
    //加线
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    imageView.image=[UIImage imageNamed:@"横.png"];
    [_tabbarView addSubview:imageView];
    
    //加打电话按钮
    UIButton *callBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    callBtn.frame=CGRectMake(320/2-28, -7, 56,56);
    [callBtn setImage:[UIImage imageNamed:@"1@x2_55"] forState:UIControlStateNormal];
    [callBtn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tabbarView addSubview:callBtn];
	
	NSArray *titleArr=@[@"想要",@"最近",@"要友",@"设置"];
	NSArray *imageNorArr=@[@"想要",@"最近",@"要友",@"设置"];
    NSArray *imageHLArr=@[@"想要蓝",@"最近蓝",@"要友蓝",@"设置蓝"];
	for (int i=0; i < 4; i++) {
		WTHButton *btn=[WTHButton buttonWithType:UIButtonTypeCustom];
        if(i<2){
            btn.frame=CGRectMake(5+i*(132/2-8), 0, 60, 48);
        }
        else if (i>=2) {
            btn.frame=CGRectMake(77+i*(132/2-8), 0, 60, 48);
            [btn setImageEdgeInsets:UIEdgeInsetsMake(4,5, 11, 25)];
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        }
		btn.tag=100+i;
        [btn setImage:[UIImage imageNamed:imageNorArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageHLArr[i]] forState:UIControlStateSelected];
		[btn setTitle:titleArr[i] forState:UIControlStateNormal];
		[btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
		[btn setTitleColor:[UIColor colorWithRed:37/255.0 green:112/255.0 blue:219/255.0 alpha:1] forState:UIControlStateSelected];
		[btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
		[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
		[_tabbarView addSubview:btn];
		if (i==0) {
			btn.selected=YES;
		}
	}
	
	
    WantViewController *wantVcl=[[WantViewController alloc] init];
    UINavigationController *nvc0=[[UINavigationController alloc] initWithRootViewController:wantVcl];
    
    ChatViewController *chatVcl=[[ChatViewController alloc] init];
    	UINavigationController *nvc1=[[UINavigationController alloc] initWithRootViewController:chatVcl];
    
	FriendViewController *friendVcl=[[FriendViewController alloc] init];
	UINavigationController *nvc2=[[UINavigationController alloc] initWithRootViewController:friendVcl];
	
	MineViewController *mineVcl=[[MineViewController alloc] init];
	UINavigationController *nvc3=[[UINavigationController alloc] initWithRootViewController:mineVcl];
	
	self.viewControllers=@[nvc0,nvc1,nvc2,nvc3];
}



-(void)btnClick:(UIButton*)btn{
	
	for (int i=0; i<4; i++) {
		UIButton *button = (UIButton *)[self.view viewWithTag:100+i];
		button.selected = NO;
	}
	btn.selected = YES;
	self.selectedIndex = btn.tag - 100;
}

//处理打电话按钮事件
-(void)callBtnClick:(UIButton *)btn{

    CallNumViewController *callVcl=[[CallNumViewController alloc] init];
    UINavigationController *callNvc=[[UINavigationController alloc] initWithRootViewController:callVcl];
    callNvc.navigationBar.hidden=YES;
    [callVcl setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:callNvc animated:YES completion:nil];

}

//通知隐藏tabbar
-(void)hidenTabbar{

    NSTimer *timerHide=[NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    [timerHide fireDate];
}
-(void)hide{

        _tabbarView.hidden=YES;
}
//通知显示tabbar
-(void)xianshiTabbar{
   
    NSTimer *timerXianshi=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(xianshi) userInfo:nil repeats:NO];
    [timerXianshi fireDate];
}
-(void)xianshi{
   
    _tabbarView.hidden=NO;

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
