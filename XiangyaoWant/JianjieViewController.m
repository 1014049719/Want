//
//  JianjieViewController.m
//  XiangyaoWant
//
//  Created by 天宏 on 15-4-2.
//  Copyright (c) 2015年 天宏. All rights reserved.
//

#import "JianjieViewController.h"
#import "Header.h"
#import "SKSplashIcon.h"
#import <Masonry.h>
#import "PhoneNumViewController.h"

@interface JianjieViewController ()<SKSplashDelegate>
{
    UIActivityIndicatorView *_indicatorView;
    UIScrollView *_scrollView;
}
@end

@implementation JianjieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

//    self.navigationController.navigationBarHidden=YES;
//    [UIApplication sharedApplication].statusBarStyle        =UIStatusBarStyleLightContent;


    //logo效果
    SKSplashIcon *twitterSplashIcon = [[SKSplashIcon alloc] initWithImage:[UIImage imageNamed:@"logoBig"] animationType:SKIconAnimationTypeBounce];
    UIColor *twitterColor = [UIColor colorWithRed:0.25098 green:0.6 blue:1.0 alpha:1.0];
    SKSplashView *splashView = [[SKSplashView alloc] initWithSplashIcon:twitterSplashIcon backgroundColor:twitterColor animationType:SKSplashAnimationTypeNone];
    splashView.delegate = self; //Optional -> if you want to receive updates on animation beginning/end
    splashView.animationDuration = 2; //Optional -> set animation duration. Default: 1s
    [self.view addSubview:splashView];
    [splashView startAnimation];
    
}

- (void) splashView:(SKSplashView *)splashView didBeginAnimatingWithDuration:(float)duration
{
    NSLog(@"Started animating from delegate");
    //To start activity animation when splash animation starts
    [_indicatorView startAnimating];
}

- (void) splashViewDidEndAnimating:(SKSplashView *)splashView
{
    NSLog(@"Stopped animating from delegate");
    //To stop activity animation when splash animation ends
    [_indicatorView stopAnimating];
    [self creatjianjieUI];
    
}

-(void)creatjianjieUI{

        _scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.contentSize=CGSizeMake(320*3, self.view.bounds.size.height);
        _scrollView.pagingEnabled=YES;
        _scrollView.showsHorizontalScrollIndicator=NO;
        [self.view addSubview:_scrollView];
    
        //图片
        NSArray *imageArray1=@[@"引导1.png",@"引导2",@"引导3"];
        NSArray *imageArray2=@[@"引导1_@2x",@"引导2_@2x",@"引导3_@2x"];
        for (int i=0; i<3; i++) {
            UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(320*i, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    
            NSLog(@"%f。。。。", [UIScreen mainScreen].bounds.size.width);
    
            if(Screen_Height<=480){
                imageView.image=[UIImage imageNamed:imageArray1[i]];
            }
            else{
                imageView.image=[UIImage imageNamed:imageArray2[i]];
            }
            [_scrollView addSubview:imageView];
            
    
        }
    //添加按钮进入注册
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor clearColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(280, 200));
        make.left.mas_offset(@660);
        make.bottom.equalTo(self.view).offset(-20);
    }];


}
//点击按钮进入注册
-(void)btnClick{

    NSLog(@".........");
    [UIView animateWithDuration:1 animations:^{
       
        _scrollView.alpha=0;
        
    } completion:^(BOOL finished) {
        [_scrollView removeFromSuperview];
        //进入主界面
        PhoneNumViewController *PhoneNumVcl=[[PhoneNumViewController alloc] init];
        UINavigationController *PhoneNumNvc=[[UINavigationController alloc] initWithRootViewController:PhoneNumVcl];
        PhoneNumNvc.navigationBar.hidden=YES;
        [self presentViewController:PhoneNumNvc animated:NO completion:nil];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
