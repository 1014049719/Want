//
//  MimaViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-6.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MimaViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *verifyCodeField;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UIButton *repeatSMSBtn;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property(nonatomic, strong)  UILabel *telLabel;
@property(nonatomic, assign) NSString* isVerify;
@property (strong, nonatomic) IBOutlet UIButton *enterBtn;


- (IBAction)BackBtnClick:(id)sender;
- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)OptionClick:(id)sender;
- (IBAction)submit:(id)sender;


@end
