
一个 ios中 支持横竖屏的小demo

1.设置Appdelegate中支持的屏幕类型

```
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
     return UIInterfaceOrientationMaskAll;
}

```

2.如果有导航栏，则在导航栏基类中实现如下方法

```
-(BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.topViewController.supportedInterfaceOrientations;
}

```

3.在控制器基类中实现如下方法，让所有页面都默认保持竖屏状态

```
- (BOOL)shouldAutorotate{
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{

    return UIInterfaceOrientationMaskPortrait;
}

```

4.在需要设置横屏的页面只需要重新控制器基类中横竖屏方法即刻，例如下面打开的页面默认横屏

```
- (BOOL)shouldAutorotate{
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{

    return UIInterfaceOrientationMaskLandscapeRight;
}

```
5.手动通过按钮点击控制横竖屏的，可以通过以下方法来控制
```
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


```