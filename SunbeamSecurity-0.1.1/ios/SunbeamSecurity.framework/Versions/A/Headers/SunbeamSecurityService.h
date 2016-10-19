//
//  SunbeamSecurityService.h
//  Pods
//
//  Created by sunbeam on 2016/10/19.
//
//

#import <Foundation/Foundation.h>

@interface SunbeamSecurityService : NSObject

+ (NSString *) md5:(NSString *) target;

+ (NSString *) decryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv;

+ (NSString *) encryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv;

@end
