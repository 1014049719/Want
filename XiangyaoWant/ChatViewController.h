//
//  WantViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-11.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addBtnClick:(id)sender;

- (IBAction)searchBtnClick:(UIButton *)btn;

@end
