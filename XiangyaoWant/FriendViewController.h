//
//  FriendViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-11.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendViewController : UIViewController

- (IBAction)addBtnClick:(id)sender;

- (IBAction)searchBtnClick:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tableview;


@end
