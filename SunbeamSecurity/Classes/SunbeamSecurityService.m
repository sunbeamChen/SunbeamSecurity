//
//  SunbeamSecurityService.m
//  Pods
//
//  Created by sunbeam on 2016/10/19.
//
//

#import "SunbeamSecurityService.h"
#import "CocoaSecurity/CocoaSecurity.h"

@implementation SunbeamSecurityService

+ (NSString *) md5:(NSString *) target
{
    CocoaSecurityResult* md5Result = [CocoaSecurity md5:target];
    
    return md5Result.hex;
}

+ (NSString *) decryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv
{
    NSData* payloadData = [self dataFromHexString:target];
    
    NSData* keyData = [self dataFromHexString:key];
    
    NSData* ivData = [self dataFromHexString:iv];
    
    CocoaSecurityResult* decryptResult = [CocoaSecurity aesDecryptWithData:payloadData key:keyData iv:ivData];
    
    return decryptResult.hex;
}

+ (NSString *) encryptTarget:(NSString *) target key:(NSString *) key iv:(NSString *) iv
{
    NSData* payloadData = [self dataFromHexString:target];
    
    NSData* keyData = [self dataFromHexString:key];
    
    NSData* ivData = [self dataFromHexString:iv];
    
    CocoaSecurityResult* encodeResult = [CocoaSecurity aesEncryptWithData:payloadData key:keyData iv:ivData];
    
    return encodeResult.hex;
}

#pragma mark - private method
+ (NSString *) hexStringFromData:(NSData *) data
{
    NSString* result;
    
    const unsigned char* dataBuffer = (const unsigned char*)[data bytes];
    if(!dataBuffer){
        return nil;
    }
    NSUInteger dataLength = [data length];
    NSMutableString* hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    for(int i = 0; i < dataLength; i++){
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    }
    result = [NSString stringWithString:hexString];
    
    return [result uppercaseString];
}

+ (NSData *) dataFromHexString:(NSString *) hexString
{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for(idx = 0; idx + 2 <= hexString.length; idx += 2){
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [hexString substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

@end
