//
//  WantViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-11.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "ChatViewController.h"
#import "SearchViewController.h"
#import "ChatTableViewCell.h"
#import <Masonry.h>
#import "liaotianViewController.h"
#import"TelephoneNumViewController.h"
#import "TabbarController.h"

@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ChatViewController

-(void)viewWillAppear:(BOOL)animated{

    TabbarController *tbvcl=[(TabbarController *)[TabbarController alloc] init];
    tbvcl.tabbarView.hidden=YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navigationController.navigationBar.hidden=YES;
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.userInteractionEnabled=YES;
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-48);
        make.top.equalTo(@99);
    }];
    
    //注册Xib
    [_tableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
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
    
    ChatTableViewCell *chatCell = (ChatTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return chatCell.frame.size.height;
}
//显示cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier=@"cell";
    ChatTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[ChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *imageArr=@[@"head1",@"head2.jpg",@"head3",@"head4.jpg",@"head5",@"head1",@"head2.jpg",@"head3",@"head4.jpg",@"head5",@"head1",@"head2.jpg"];
    cell.iconImage.image=[UIImage imageNamed:imageArr[indexPath.row]];
    
    return cell;
    
}

//选定cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //点击后取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    liaotianViewController *liaotianVcl=[[liaotianViewController alloc] init];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"yincangTabbar" object:nil];
    [self.navigationController pushViewController:liaotianVcl animated:YES];
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

//添加通讯录
- (IBAction)addBtnClick:(id)sender {
    
    TelephoneNumViewController *TelephoneNumVcl=[[TelephoneNumViewController alloc] init];
    UINavigationController *TelephoneNumNcl=[[UINavigationController alloc] initWithRootViewController:TelephoneNumVcl];
    TelephoneNumVcl.navigationController.navigationBar.hidden=YES;
    [TelephoneNumVcl setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:TelephoneNumNcl animated:YES completion:nil];

}


//搜索按钮事件
- (IBAction)searchBtnClick:(id)sender {
    
    NSLog(@"点击了搜索好友");
    SearchViewController *searchVcl=[[SearchViewController alloc] init];
    [searchVcl setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:searchVcl animated:YES completion:nil];
}
@end
