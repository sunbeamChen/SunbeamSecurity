//
//  SunbeamSecurityService.h
//  Pods
//
//  Created by sunbeam on 2016/10/19.
//
//

#import <Foundation/Foundation.h>

#define SUNBEAM_SECURITY_VERSION @"0.1.4"

@interface SunbeamSecurityService : NSObject

+ (NSString *) md5:(NSString *) target;

// 加解密NSString类型
+ (NSString *) encryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv;

+ (NSString *) decryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv;

// 加解密jsonObject类型
+ (NSString *) encryptJsonObject:(id) jsonObject key:(NSString *) key iv:(NSString *) iv;

+ (id) decryptJsonObject:(NSString *) jsonString key:(NSString *) key iv:(NSString *) iv;

@end
