//
//  AlterView.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-23.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "AlterView.h"

@implementation AlterView

//号码长度超出提醒
+(void)AlterViewShowWithMesssge:(NSString *)messageStr{

    UIAlertView *alterView=[[UIAlertView alloc] initWithTitle:@"提示⚠️" message:messageStr delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alterView show];
    
    
}

@end
