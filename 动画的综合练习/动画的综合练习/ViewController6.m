//
//  LocationInfo.h
//  动画的综合
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//


#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    [self createTwotextFl];
    [self createbutton];
    
}

- (void)createbutton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 250, 60, 60);
    
    button.layer.cornerRadius = 30;
    button.layer.backgroundColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    
    [button setTitle:@"确定" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)button{
    
    UITextField *user = (UITextField *)[self.view viewWithTag:100];
    UITextField *pass = (UITextField *)[self.view viewWithTag:200];
    
    if ([self.delegate respondsToSelector:@selector(viewContriller6:userName:passWord:)]) {
        
        [self.delegate viewContriller6:self userName:user.text passWord:pass.text];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)createTwotextFl{
    
    UITextField *textfl1 = [[UITextField alloc]initWithFrame:CGRectMake(80, 100, 200, 40)];
    textfl1.placeholder = @"用户名";
    textfl1.borderStyle = UITextBorderStyleRoundedRect;
    textfl1.tag = 100;
    
    UITextField *textfl2 = [[UITextField alloc]initWithFrame:CGRectMake(80, 160, 200, 40)];
    textfl2.borderStyle = UITextBorderStyleRoundedRect;
    textfl2.secureTextEntry = YES;
    textfl2.placeholder = @"密码";
    textfl2.tag = 200;
    
    [self.view addSubview:textfl1];
    [self.view addSubview:textfl2];
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
