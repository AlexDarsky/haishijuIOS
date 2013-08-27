//
//  HaishijuServerHelper.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuServerHelper.h"
#import "JSONKit.h"

@implementation HaishijuServerHelper
static HaishijuServerHelper *shareHaishijuServerHelper = nil;
+(HaishijuServerHelper*)shareHaishijuServerHelper
{
    
    if (shareHaishijuServerHelper == nil) {
        shareHaishijuServerHelper = [[super allocWithZone:NULL] init];
    }
    return shareHaishijuServerHelper;
}

-(NSDictionary*)sendRequestByUrl:(NSString *)requestUrl
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[self getEncodedString:requestUrl]]];
    [request setHTTPMethod:@"POST"];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *jsonString=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
   jsonString=[jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
     jsonString=[jsonString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    NSLog(@"%@",jsonString);
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
   // NSData* jsonData = [demoString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resultsDictionary = [jsonData objectFromJSONData];
   //NSDictionary *resultsDictionary = [jsonString objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
    if (resultsDictionary==nil) {
        NSLog(@"empty");
    }
    return resultsDictionary;
}
-(NSString*)getEncodedString:(NSString*)urlString
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)urlString,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}
@end
