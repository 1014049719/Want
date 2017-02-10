//
//  PingLunTableViewCell.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-3-17.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "PingLunTableViewCell.h"

@implementation PingLunTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _pinglunImageView.layer.masksToBounds = YES;
    _pinglunImageView.layer.cornerRadius=25/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
