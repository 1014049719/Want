//
//  TelephoneNumViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-18.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "TelephoneNumViewController.h"
#import "SearchViewController.h"
#import <Masonry.h>
#import "TelePhoneTableViewCell.h"

@interface TelephoneNumViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TelephoneNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    //注册Xib
    [_tableView registerNib:[UINib nibWithNibName:@"TelePhoneTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
   
}

//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
//每组多少列
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 12;
}
//每行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TelePhoneTableViewCell *telephoneNumCell=(TelePhoneTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return telephoneNumCell.frame.size.height;
    ;}
//显示cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier1=@"cell1";
    TelePhoneTableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:identifier1];
    if (cell1==nil) {
        cell1=[[TelePhoneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    
    
//    if (indexPath.section==0) {
//        return cell1;
//    }
//    else if (indexPath.section==2){
//        return cell3;
//    }
    
    NSArray *imageArr=@[@"head1",@"head2.jpg",@"head3",@"head4.jpg",@"head5",@"head1",@"head2.jpg",@"head3",@"head4.jpg",@"head5",@"head1",@"head2.jpg"];
    cell1.iconImage.image=[UIImage imageNamed:imageArr[indexPath.row]];
    
    return cell1;

}
//尾部索引
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
//    if (section==0) {
//        return 20;
//    }
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 30;
}
//头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
//    view.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    view.backgroundColor=[UIColor redColor];
    return view;
}
//尾部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
//    view.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    view.backgroundColor=[UIColor blueColor];
    return view;
}
//头部索引
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return @"111";
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    return @"222";
    
}

//选定cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //点击后取消选中状态
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

//返回
- (IBAction)backBtnClick:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}
//搜索
- (IBAction)searchBtnClick:(id)sender {
    
    NSLog(@"点击了搜索好友");
    SearchViewController *searchVcl=[[SearchViewController alloc] init];
    [searchVcl setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:searchVcl animated:YES completion:nil];
}
@end
