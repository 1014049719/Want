//
//  WTHButton.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-16.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "WTHButton.h"

@implementation WTHButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




#pragma 重写按钮图片显示范围
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    contentRect.origin.x=17;
    contentRect.origin.y=3;
    contentRect.size.width=30;
    contentRect.size.height=30;
    return contentRect;
    
}

#pragma 重写按钮文字显示范围
-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    contentRect.origin.x=19;
    contentRect.origin.y=23;
    contentRect.size.width=40;
    contentRect.size.height=30;
    return contentRect;
}
@end
