//
//  CallNumViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-21.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallNumViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *NumLabel;
//电话号码
@property (strong,nonatomic)NSString *PhoneNumStr;
//清除按钮
@property (strong, nonatomic) IBOutlet UIButton *deletBtn;

- (IBAction)deletBtnClick:(id)sender;

- (IBAction)backBtn:(id)sender;
- (IBAction)callBtnClick:(id)sender;
- (IBAction)NumberBtnClick:(UIButton *)Btn;


@end
