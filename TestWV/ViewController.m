//
//  ViewController.m
//  TestWV
//
//  Created by TestSmirk on 2017/4/21.
//  Copyright © 2017年 TestSmirk. All rights reserved.
//

#import "ViewController.h"

UIWebView *webView;

@interface ViewController ()
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.height)];
    [button1 setTitle:@"123" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor brownColor];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
//测试是否能调用 js 代码
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 20, [UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.height)];
    [button2 setTitle:@"123" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

    webView.delegate = self;
    [webView loadRequest:
            [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]]]];
    [self.view addSubview:webView];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)button2Click {
    NSLog(@"1234");

    //这句代码是验证是否能调用js的关键.js中必须要return 才能正常接受string
    NSString *string = [webView stringByEvaluatingJavaScriptFromString:@"testFunc1(\"qwewq\");"];
    NSLog(string);

}

- (void)button1Click {
    NSLog(@"123");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)call {

}

- (void)getCall:(NSString *)callString {

}


@end
