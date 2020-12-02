//
//  Test2ViewController.m
//  rotationDmo
//
//  Created by chenhao on 2020/12/2.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()

@property (nonatomic,assign) BOOL isOrientationLandscape;

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加两个按钮
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
    leftBtn.tag = 0;
    [leftBtn setTitle:@"点击横屏" forState:UIControlStateNormal];
    [leftBtn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(itemCLick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 40)];
    rightBtn.tag = 1;
    [rightBtn setTitle:@"点击竖屏" forState:UIControlStateNormal];
    [rightBtn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(itemCLick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:leftBtn];
    [self.view addSubview:rightBtn];
    
}

-(void)itemCLick:(UIButton *)btn{
    ///
    if(btn.tag == 0){
        if(self.isOrientationLandscape == NO){
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
            self.isOrientationLandscape = YES;
            [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
            //强制翻转屏幕，Home键在右边。
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
        }
        
    }else{
        if(self.isOrientationLandscape){
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
            
            self.isOrientationLandscape =  NO;
            [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
            //强制翻转屏幕，Home键在右边。
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
            
        }
//        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    
    if (self.isOrientationLandscape) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }
    return UIInterfaceOrientationMaskPortrait;
    
}


@end
