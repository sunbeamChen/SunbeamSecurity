//
//  SunbeamSecurityViewController.m
//  SunbeamSecurity
//
//  Created by sunbeamChen on 10/19/2016.
//  Copyright (c) 2016 sunbeamChen. All rights reserved.
//

#import "SunbeamSecurityViewController.h"
#import <SunbeamSecurity/SunbeamSecurity.h>

@interface SunbeamSecurityViewController ()

@end

@implementation SunbeamSecurityViewController

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray* array = [NSMutableArray array];
    NSDictionary* dict1 = @{@"lockId":@"10001",@"authKey":@"12345"};
    NSDictionary* dict2 = @{@"lockId":@"10002",@"authKey":@"12345"};
    [array addObject:dict1];
    [array addObject:dict2];
    //[self arrayTest:array];
    [self arrayTest2:array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) arrayTest:(NSMutableArray *) array
{
    BOOL valid = [NSJSONSerialization isValidJSONObject:array];
    if (valid) {
        NSLog(@"合法的JsonObject");
    } else {
        NSLog(@"非法的JsonObject");
    }
    NSString* key = [SunbeamSecurityService md5:@"123456"];
    // array -> string -> encrypt -> string
    NSError* error1 = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error1];
    if (error1) {
        NSLog(@"jsonObject转NSData出错：%@", error1);
    } else {
        NSLog(@"jsonObject转NSData成功：%@", jsonData);
    }
    
    NSData* encryptData = [SunbeamSecurityService encryptTargetData:jsonData key:key iv:key];
    NSLog(@"加密后data为:%@", encryptData);
    
    NSString* uploadString = [SunbeamSecurityService hexStringFromData:encryptData];
    NSLog(@"上传string为:%@", uploadString);
    
    NSData* downloadData = [SunbeamSecurityService dataFromHexString:uploadString];
    NSLog(@"下载data为:%@", downloadData);
    
    NSData* decryptData = [SunbeamSecurityService decryptTargetData:downloadData key:key iv:key];
    NSLog(@"解密后data为：%@", decryptData);
    
    NSError* error = nil;
    NSArray* decryptArray = [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"string转array出错：%@", error);
    } else {
        NSLog(@"string转array成功：%@", decryptArray);
    }
}

- (void) arrayTest2:(NSMutableArray *) array
{
    BOOL valid = [NSJSONSerialization isValidJSONObject:array];
    if (valid) {
        NSLog(@"合法的JsonObject");
    } else {
        NSLog(@"非法的JsonObject");
    }
    NSString* key = [SunbeamSecurityService md5:@"123456"];
    // array -> string -> encrypt -> string
    NSError* error1 = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error1];
    if (error1) {
        NSLog(@"jsonObject转NSData出错：%@", error1);
    } else {
        NSLog(@"jsonObject转NSData成功：%@", jsonData);
    }
    
    NSString* dataString = [SunbeamSecurityService hexStringFromData:jsonData];
    NSString* encryptString = [SunbeamSecurityService encryptTarget:dataString key:key iv:key];
    NSLog(@"上传string为:%@", encryptString);
    
    NSString* decryptString = [SunbeamSecurityService decryptTarget:encryptString key:key iv:key];
    NSData* decryptData = [SunbeamSecurityService dataFromHexString:decryptString];
    NSLog(@"解密后data为：%@", decryptData);
    
    NSError* error = nil;
    NSArray* decryptArray = [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"string转array出错：%@", error);
    } else {
        NSLog(@"string转array成功：%@", decryptArray);
    }
}

@end
