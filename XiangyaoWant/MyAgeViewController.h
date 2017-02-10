//
//  MyAgeViewController.h
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-12.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAgeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *sexImageView;
@property (strong, nonatomic) IBOutlet UIPickerView *PickerView;


- (IBAction)BackBtnClick:(id)sender;
- (IBAction)NextBtnClick:(id)sender;


@end
