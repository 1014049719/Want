//
//  XiangqingViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-16.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WantTableViewCell;



@interface XiangqingViewController : UIViewController

@property (assign,nonatomic) float h;

@property (strong, nonatomic) IBOutlet UITableView *tableview;

- (IBAction)backBtnClick:(id)sender;

@end
