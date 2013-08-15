//
//  HaishijuServerHelper.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HaishijuServerHelper : NSObject
-(NSDictionary*)LoadListAtPage:(int)type withSearchField:(NSString*)searchField withKeyword:(NSString*)keyword withPage:(int)page;
-(NSDictionary*)LoadDetailAtPage:(int)type :(NSString*)idNumber;
-(NSDictionary*)sendRequestByUrl:(NSString*)requestUrl;
+(HaishijuServerHelper*)shareHaishijuServerHelper;
@end
