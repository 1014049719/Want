//
//  PhoneNumViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-6.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneNumViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *NumTextField;

- (IBAction)TextFieldEnd:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *NextBtn;
- (IBAction)NextBtnClick:(id)sender;

@end
