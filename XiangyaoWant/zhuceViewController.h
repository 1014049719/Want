//
//  zhuceViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-23.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zhuceViewController : UIViewController

@property (strong,nonatomic)NSString *NumStr;
@property (strong, nonatomic) IBOutlet UILabel *phonrNumchuanzhiLabel;

@property (strong, nonatomic) IBOutlet UITextField *haomaTextField;
@property (strong, nonatomic) IBOutlet UITextField *yanzhengmaTextField;
@property (strong, nonatomic) IBOutlet UITextField *xinmimaTextField;

- (IBAction)backBtnClick:(id)sender;
- (IBAction)nextBtnClick:(id)sender;

- (IBAction)textFieldEnd:(id)sender;


@end
