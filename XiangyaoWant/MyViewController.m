//
//  MyViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-24.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "MyViewController.h"
#import "OTCover.h"
#import <Masonry.h>
#import "myTableViewCell.h"

#define ImageHight 200.0f

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *_headImageView;
    UITableView *_tableView;
}
@end

@implementation MyViewController


-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;

    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.contentInset=UIEdgeInsetsMake(ImageHight, 0, 0, 0);
    _tableView.userInteractionEnabled=YES;
    [self.view addSubview:_tableView];
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(0);
        make.width.equalTo(self.view);
        make.top.equalTo(self.view).offset(27);
    }];
    
    //设置头部视图
    _headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, -ImageHight-25, self.view.frame.size.width, ImageHight)];
    _headImageView.image=[UIImage imageNamed:@"埃菲尔背景.jpg"];
    _headImageView.autoresizesSubviews=YES;
    _headImageView.userInteractionEnabled=YES;
    _headImageView.contentMode=UIViewContentModeScaleAspectFill;
    [_tableView addSubview:_headImageView];
    
    //头像背景
    UIImageView *iconBgView=[[UIImageView alloc] init];
    iconBgView.image=[UIImage imageNamed:@"圆背景蓝"];
    iconBgView.userInteractionEnabled=YES;
    [_headImageView addSubview:iconBgView];
    [iconBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(_headImageView).offset(8);
        make.centerY.equalTo(_headImageView).offset(90);
    }];
    //头像按钮
    UIButton *iconBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [iconBtn setBackgroundImage:[UIImage imageNamed:@"wth"] forState:UIControlStateNormal];
    iconBtn.layer.cornerRadius=55/2;
    iconBtn.layer.masksToBounds=YES;
    [iconBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [iconBgView addSubview:iconBtn];
    [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(iconBgView);
        make.size.mas_equalTo(CGSizeMake(54, 54));
    }];

   //角色按钮
    UIButton *jueseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [jueseBtn setBackgroundImage:[UIImage imageNamed:@"高富帅彩"] forState:UIControlStateNormal];
    [_headImageView addSubview:jueseBtn];
    [jueseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(75, 180));
        make.centerY.equalTo(_headImageView).offset(40);
        make.right.equalTo(_headImageView).offset(-8);
    }];
    
    //文字 岁
    UILabel *label=[[UILabel alloc] init];
    label.text=@"岁";
//    label.shadowColor=[UIColor colorWithRed:255/255.0 green:138/255.0 blue:158/255.0 alpha:1];
    label.shadowColor=[UIColor colorWithRed:69/255.0 green:182/255.0 blue:255/255.0 alpha:1];
    label.font=[UIFont systemFontOfSize:13];
    label.textColor=[UIColor whiteColor];
    [_headImageView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.right.equalTo(jueseBtn.mas_left).offset(-2);
        make.centerY.equalTo(iconBgView).offset(25);
    }];
    
    //年龄
    UILabel *agelabel=[[UILabel alloc] init];
    agelabel.text=@"24";
    agelabel.shadowColor=[UIColor colorWithRed:69/255.0 green:182/255.0 blue:255/255.0 alpha:1];
    agelabel.font=[UIFont systemFontOfSize:43];
    agelabel.textColor=[UIColor whiteColor];
    [_headImageView addSubview:agelabel];
    [agelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(48, 48));
        make.centerY.equalTo(iconBtn).offset(12);
        make.right.equalTo(label.mas_left).offset(1);
    }];
    
    //签名
    UILabel *qianmingLabel=[[UILabel alloc] init];
    qianmingLabel.text=@"学会下一次进步，是做大自己的有效法则。因此千万不要让自己睡在已有的成功温床上";
    qianmingLabel.numberOfLines=2;
    qianmingLabel.textColor=[UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1];
    qianmingLabel.font=[UIFont systemFontOfSize:12];
    [_headImageView addSubview:qianmingLabel];
    [qianmingLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(jueseBtn).offset(-60);
        make.left.equalTo(iconBgView).offset(10);
        make.right.equalTo(jueseBtn.mas_left).offset(-4);
        make.height.mas_equalTo(@30);
    }];
    //加背景
    UIImageView *qianmingBgView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"签名背景白"]];
    qianmingBgView.alpha=0.8;
    [_headImageView addSubview:qianmingBgView];
    [qianmingBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(qianmingLabel);
        make.edges.equalTo(qianmingLabel).insets(UIEdgeInsetsMake(-3,-3,-3,-3));
    }];
    [_headImageView bringSubviewToFront:qianmingLabel];
    
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView setSeparatorInset:UIEdgeInsetsMake(0, 60, 0, 0)];
    [_tableView setSeparatorColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]];
    
    //注册xib
    [_tableView registerNib:[UINib nibWithNibName:@"myTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];

    [self.view bringSubviewToFront:_navigationView];
}

//滚动时拉伸头部视图
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y=scrollView.contentOffset.y;
    if (y<-ImageHight) {
        CGRect frame=_headImageView.frame;
        frame.origin.y=y-25;
        frame.size.height=-y;
        _headImageView.frame=frame;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier=@"cell";
    myTableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (Cell==nil) {
        Cell=[[myTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    return Cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    myTableViewCell *cell=(myTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

//点击头像
-(void)BtnClick:(UIButton *)btn{

    NSLog(@"点了头像。");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

//返回
- (IBAction)BackBtnClick:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
