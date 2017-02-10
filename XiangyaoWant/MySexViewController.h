//
//  MySexViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-12.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySexViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *maleBtn;
@property (strong, nonatomic) IBOutlet UIButton *femaleBtn;

- (IBAction)ImageBtnClick:(UIButton *)btn;

- (IBAction)backBtnClick:(id)sender;
- (IBAction)nextBtnClick:(id)sender;

@end
