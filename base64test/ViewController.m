//
//  ViewController.m
//  base64test
//
//  Created by ITxiansheng on 16/6/16.
//  Copyright © 2016年 ITxiansheng. All rights reserved.
//

#import "ViewController.h"
#import "Help.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //MD5
    NSString *md5Str = [Help md5:@"我爱你"];
    NSLog(@"md5Str is %@",md5Str);//Log is 4F2016C6B934D55BD7120E5D0E62CCE3
    
    //Base64
    NSString *Base64Str = [Help base64StringFromText:@"我爱你"];
    NSLog(@"Base64Str is %@",Base64Str);//Log is 5oiR54ix5L2g
    
    NSString *oriBase64Str = [Help textFromBase64String:Base64Str];
    NSLog(@"oriBase64Str is %@",oriBase64Str);//Log is  我爱你
    
    //DES
    NSString *desEnStr = [Help encryptSting:@"我爱你" key:@"521" andDesiv:@"521"];
    NSLog(@"desEnStr is %@",desEnStr);//Log is  389280aa791ee933
    NSString *desDeStr =[Help decryptWithDESString:desEnStr key:@"521" andiV:@"521"];
    NSLog(@"desDeStr is %@",desDeStr);//Log is  我爱你
    
    //AES
    NSData *aesEnData = [Help AES128EncryptWithKey:@"521" iv:@"521" withNSData:[@"我爱你" dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *aesEnStr = [Help base64EncodedStringFrom:aesEnData];
    NSLog(@"aesEnStr is %@",aesEnStr);//Log is HZKhnRLlQ8XjMjpelOAwsQ==
    
    NSData *aesDeData = [Help AES128DecryptWithKey:@"521" iv:@"521" withNSData:aesEnData];
    NSString *aesDEStr = [Help base64EncodedStringFrom:aesDeData];
    NSString *result = [Help textFromBase64String:aesDEStr];
    NSLog(@"aesDEStr is %@ and result is %@",aesDEStr,result);//Log is aesDEStr is 5oiR54ix5L2gAAAAAAAAAA== and result is 我爱你
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
