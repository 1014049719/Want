

#ifndef HealthCare_Header_h
#define HealthCare_Header_h

#define KEY_WINDOW  [[UIApplication sharedApplication]keyWindow]
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Zero 0
#define Nav_Height 64
#define Size_Five 5
#define Size_Ten 10
#define Size_Fifty 50
#define Label_Height 15
#define Nomal_Cell 80
#define Label_Size 15
#define Label_Small 12
#define Label_Big 20

#define BackColor [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2]

//NSUserDefault

/*
 @overview: AFHTTPClient 对象
 */

#define CLIENT [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:Base_URL]]


//判断设备是否IPHONE5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是IOS7 系统对应的视图起点
#define IOS7_TOP_Y ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 20 :0)

#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) // 判断是否是IOS6的系统

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) // 判断是否是IOS7的系统


//动态获取设备高度
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
//动态获取设备宽度
#define IPHONE_WIDTH [UIScreen mainScreen].bounds.size.width

//设置颜色
#define COLOR(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//设置颜色与透明度
#define HEXCOLORAL(rgbValue, al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]

#define COMMENT_COLOR [UIColor colorWithRed:69/255.f green:161/255.f blue:193/255.f alpha:1.0f]

/********************************* 首页 ****************************************/
#define Cell_Height 184
#define Label_font  14
#define Scroolview_Height 145

#define Bin(x,y,width,height)  CGRectMake(x,y,width,height)


#define PathName @"info.text"
#define ArcKey @"array"

#endif

#pragma mark -------------------------------------------------------  所有点击事件  -----------------------------------------------------------
#pragma mark ----------------------------------------------- UITableView 代理方法 ------------------------------------------------------------
#pragma mark -------------------------------------------------------   初始化视图 -------------------------------------------------------------
#pragma mark ----------------------------------------------------- 数据请求 ------------------------------------------------------------------


#pragma mark --- 调整行的间距
//UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
//[label setBackgroundColor:[UIColor blackColor]];
//[label setTextColor:[UIColor whiteColor]];
//[label setNumberOfLines:0];
//
//NSString *labelText = @"可以自己按照宽高，字体大小，来计算有多少行。。然后。。。每行画一个UILabel。。高度自己可以控制把这个写一个自定义的类。 ";
//
//NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
//NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//
//[paragraphStyle setLineSpacing:LINESPACE];//调整行间距
//
//[attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
//label.attributedText = attributedString;
//[self.view addSubview:label];
//[label sizeToFit];






