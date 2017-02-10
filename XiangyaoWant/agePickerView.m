//
//  agePickerView.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-21.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "agePickerView.h"

@implementation agePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //数据源
        _DataArr=[[NSMutableArray alloc] init];
        [self creatUI];
    }
    return self;
}

-(void)creatUI{

    UIPickerView *pickerView=[[UIPickerView alloc] initWithFrame:self.bounds];
    [self addSubview:pickerView];
    pickerView.delegate=self;
    pickerView.dataSource=self;
    
    //添加数据源
    for (int i=0; i<=120; i++) {
        [_DataArr addObject:[NSString stringWithFormat:@"%d",i]];
}
    
    //设定默认值
    [pickerView selectRow:20 inComponent:0 animated:YES];
    
}

//返回多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}
//返回每列多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _DataArr.count;
}

//自定义显示内容
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 40)];
    label.text=[_DataArr objectAtIndex:row];
    label.textColor=COLOR(48, 142, 244);
    label.font = [UIFont systemFontOfSize:25];
    
    UIView *myView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    [myView addSubview:label];
    return myView;
}

//显示当前滚动停止内容
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"滚动到了 %@ 岁",[_DataArr objectAtIndex:row]);

}

//高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30;
}

@end
