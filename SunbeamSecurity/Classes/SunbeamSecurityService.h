//
//  SunbeamSecurityService.h
//  Pods
//
//  Created by sunbeam on 2016/10/19.
//
//

#import <Foundation/Foundation.h>

#define SUNBEAM_SECURITY_VERSION @"0.1.3"

@interface SunbeamSecurityService : NSObject

+ (NSString *) md5:(NSString *) target;

+ (NSString *) encryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv;

+ (NSString *) decryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv;

+ (NSData *) encryptTargetData:(NSData *) target key:(NSString *) key iv:(NSString *) iv;

+ (NSData *) decryptTargetData:(NSData *) target key:(NSString *) key iv:(NSString *) iv;

+ (NSString *) hexStringFromData:(NSData *) data;

+ (NSData *) dataFromHexString:(NSString *) hexString;

@end
