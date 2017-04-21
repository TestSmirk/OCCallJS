//
//  ViewController.h
//  TestWV
//
//  Created by TestSmirk on 2017/4/21.
//  Copyright © 2017年 TestSmirk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@interface ViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) JSContext *jsContext;

-(void)call;
-(void)getCall:(NSString *)callString;

@end

