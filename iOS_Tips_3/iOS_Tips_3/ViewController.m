//
//  ViewController.m
//  iOS_Tips_3
//
//  Created by yuanshi on 2020/7/16.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.textField addTarget:self action:@selector(quickInputHandle:) forControlEvents:UIControlEventEditingChanged];
    
    
   // iOS TextContentType两个特别的属性
    self.textField.textContentType = UITextContentTypeUsername;
    self.textField.textContentType = UITextContentTypePassword;
    
    
    // iOS清除Cookie
    
    NSArray<NSHTTPCookie *> *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    for (NSHTTPCookie *cookie in cookies) {

      [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    
    //清除某个网址的Cookie
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    if (url) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
        for (NSHTTPCookie *cookie in cookies) {
        
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
    
    // 清除某个网址上的某个指定名字的Cookie
    NSURL *url1 = [NSURL URLWithString:@"https://www.baidu.com"];
    if (url1) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
        for (NSHTTPCookie *cookie in cookies) {
             
            if ([cookie.name isEqualToString:@"theCookie"]) {
            
                [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
            }
        }
    }
   
}

 //iOS UIColor 深浅色判断
- (BOOL)isLighterColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    
    BOOL isLighter = NO;
    if(red*0.299 + green*0.578 + blue*0.114 >= 192) {
        
        //浅色
        isLighter = YES;
    }
    
    return isLighter;
}

- (BOOL)isLighterColorWithHXB:(NSInteger)hexColor {
    
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    
    return [self isLighterColorWithRed:red green:green blue:blue];
}

// iOS UITableView隐去section头尾
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
 
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return nil;
}
// iOS自动记住键盘类型
//- (NSString *)textInputContextIdentifier {
//
//    return self.conversation.conversationId;
//}

// iOS 12自动填充验证码
- (void)quickInputHandle:(id)sender {
    
    NSString *code = self.textField.text;
    if (code.length == 4) {
        
//        for (NSInteger idx = 0; idx < self.textFieldArray.count; idx ++) {
//
//            UITextField *textField = (UITextField *)self.textFieldArray[idx];
//            textField.text = [code substringWithRange:NSMakeRange(idx,1)];
//        }
    }
}



@end
