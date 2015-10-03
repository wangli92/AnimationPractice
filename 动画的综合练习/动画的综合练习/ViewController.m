//
//  LocationInfo.h
//  动画的综合
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//


#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController6.h"


@interface ViewController () <myselfPro>{
    
    UITextField *_userNameM;
    UITextField *_passWordM;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self createTwoButton];
    [self createbutton];
    [self createTwotextFl];
    [self addTap];
    //[self createtextfiled];
    //[self createUILabel];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航背景@2x" ] forBarMetrics:UIBarMetricsDefault];
}


- (void)createTwotextFl{
    
    _userNameM = [[UITextField alloc]initWithFrame:CGRectMake(80, 300, 200, 40)];
    _userNameM.placeholder = @"用户名";
    _userNameM.borderStyle = UITextBorderStyleRoundedRect;
    _userNameM.tag = 100;
    
    _passWordM = [[UITextField alloc]initWithFrame:CGRectMake(80, 360, 200, 40)];
    _passWordM.borderStyle = UITextBorderStyleRoundedRect;
    
    _passWordM.placeholder = @"密码";
    _passWordM.tag = 200;
    
    _userNameM.delegate = self;
    _passWordM.delegate = self;
    
    [self.view addSubview:_userNameM];
    [self.view addSubview:_passWordM];
}


- (void)createbutton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 100, 60, 60);
    button.backgroundColor = [UIColor brownColor];
    
    [button setTitle:@"注册" forState:UIControlStateNormal];
    button.layer.cornerRadius = 30;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(150, 200, 60, 60);
    button2.backgroundColor = [UIColor purpleColor];
    
    [button2 setTitle:@"登录" forState:UIControlStateNormal];
    button2.layer.cornerRadius = 30;
    button2.layer.borderColor = [UIColor blueColor].CGColor;
    button2.layer.borderWidth = 5;
    [self.view addSubview:button2];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [button2 addTarget:self action:@selector(buttonClick2:) forControlEvents:
     UIControlEventTouchUpInside];
    
}

- (void)buttonClick:(UIButton *)button{
    
    ViewController6 *view6 = [[ViewController6 alloc]init];
    
    view6.delegate = self;
    
    [self presentViewController:view6 animated:YES completion:^{
        NSLog(@"完成跳转");
    }];
}

- (void)buttonClick2:(UIButton *)button{
    
}


- (void)createTwoButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 70, 70);
    
    [button setTitle:@"Next" forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 35;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    
    button.backgroundColor = [UIColor brownColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)next:(UIButton *)button{
    
    
    ViewController2 *viewCL = [[ViewController2 alloc]init];
    
    [self.navigationController pushViewController:viewCL animated:YES];
    
    //[self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewContriller6:(ViewController6 *)viewcotroll userName:(NSString *)username passWord:(NSString *)password{
    
    _userNameM.text = [NSString stringWithFormat:@"%@",username];
    _passWordM.text = [NSString stringWithFormat:@"%@",password];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)addTap{
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handle:)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)handle:(UITapGestureRecognizer *)tapg{
    NSLog(@"手势识别成功");
    
//    UITextField *frist = [self findfrist];
//    [frist resignFirstResponder];
    [_userNameM resignFirstResponder];
    [_passWordM resignFirstResponder];
    
}

//- (UITextField *)findfrist{
//    NSArray *subViewArry = self.view.subviews;
//    
//    for (id obj in subViewArry) {
//        if ([obj isKindOfClass:[UITextField class]]) {
//            if ([obj isFirstResponder]) {
//                return (UITextField *)obj;
//            }
//        }
//    }
//    
//    
//    return nil;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
