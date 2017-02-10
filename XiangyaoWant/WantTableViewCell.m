//
//  WantTableViewCell.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-14.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "WantTableViewCell.h"
#import "PingLunTableViewCell.h"
#import "WantViewController.h"
#import <Masonry.h>

@interface WantTableViewCell ()

@property (nonatomic) MASConstraint *bottom;

@end

@implementation WantTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    //选中样式
    self.selectionStyle=UITableViewCellSelectionStyleNone;

}

//返回几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
//每组返回几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}
//高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
//显示cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier2=@"pinglunCell";
    PingLunTableViewCell *pinglunCell=[tableView dequeueReusableCellWithIdentifier:identifier2];
    if (pinglunCell==nil) {
        pinglunCell=[[PingLunTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
    }
    
    pinglunCell.pinglunLabel.text = @"12345678900123456789123456789001234567891234567890012345678912345678900123456789";

    CGSize boundSize = CGSizeMake(216, CGFLOAT_MAX);
    CGSize requiredSize = [pinglunCell.pinglunLabel.text sizeWithFont:[UIFont systemFontOfSize:20] constrainedToSize:boundSize lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = pinglunCell.frame;
    rect.size.height = requiredSize.height+5;
    pinglunCell.frame = rect;
    
    return pinglunCell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//点击留言按钮动作
//- (IBAction)liuyanBtnClick:(id)sender {
//    UITableView *tableView = (UITableView *)[[self superview] superview];
//    CGRect rect = [self convertRect:((UIButton *)sender).frame toView:[tableView superview]];
//    CGFloat offset = rect.origin.y - ([UIScreen mainScreen].bounds.size.height - 200);
//    
//    CGPoint point = tableView.contentOffset;
//    point.y += offset;
//    
//    NSLog(@"button y : %f  offset: %f  contentOffset : %f ", rect.origin.y, offset, tableView.contentOffset.y);
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        tableView.contentOffset = point;
//    }];
//    
//}
@end
