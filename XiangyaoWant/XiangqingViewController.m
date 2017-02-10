//
//  XiangqingViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-16.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "XiangqingViewController.h"
#import "WantTableViewCell.h"

@interface XiangqingViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation XiangqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableview.delegate=self;
    _tableview.dataSource=self;
    
    //注册xib
    [_tableview registerNib:[UINib nibWithNibName:@"WantTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
//每组多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
//显示cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier=@"cell";
    WantTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[WantTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

//返回高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSLog(@"%f",_h);
    return _h;
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
