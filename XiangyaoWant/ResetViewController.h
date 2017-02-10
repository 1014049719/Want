//
//  ResetViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-9.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *PhoneNumTextFileld;
@property (strong, nonatomic) IBOutlet UITextField *yanzhengmaTextField;
@property (strong, nonatomic) IBOutlet UITextField *mimaTextFlied;

@property (strong, nonatomic) IBOutlet UIButton *submitBtn;

- (IBAction)BackBtnClick:(id)sender;

- (IBAction)TextFieldEnd:(id)sender;

- (IBAction)submitBtnClick:(id)sender;


@end
