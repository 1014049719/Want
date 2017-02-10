//
//  touxiangViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-21.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface touxiangViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nichengTextField;
@property (strong, nonatomic) IBOutlet UIButton *jinruWantbtn;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UIImageView *xialaView;

- (IBAction)textFleldEnd:(id)sender;


- (IBAction)ageBtnClick:(id)sender;

- (IBAction)backBtnClick:(id)sender;
- (IBAction)jinruWantBtnClick:(id)sender;

@end
