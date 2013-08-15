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
-(NSDictionary*)LoadListAtPage:(int)type withSearchField:(NSString*)searchField withKeyword:(NSString*)keyword withPage:(int)page
{
    NSString *typeString=nil;
    switch (type) {
        case 0:
        {
            typeString=@"cxcb";
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
        case 9:
        {
            
        }
            break;
        case 10:
        {
            
        }
            break;
        case 11:
        {
            
        }
            break;
        case 12:
        {
            
        }
            break;
        case 13:
        {
            
        }
            break;
    }
   // NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/ios/getDataList.asp?type=%@&searchField=%@&keyword=%@&Page=%d",typeString,searchField,keyword,page];
    NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=%@&key=%@&Page=%d",typeString,keyword,page];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[self getEncodedString:urlString]]];
    [request setHTTPMethod:@"POST"];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *jsonString=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    //NSLog(@"%@",jsonString);
   //  NSString *demoString=@"{\"datalist\": [{\"ID\":\"13\",\"ChuanMing\":\"浙定39136\",\"Info\":\"\",\"ChuanJiGang\":\"舟山\",\"Type\":\"干货船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"2010年12月28日，汕头海事局执法人员对\"浙定39136\"实施安全检查，发现船舶存在船舶舱口围壁破损、缺货舱舱口盖、配员不足等严重缺陷，该轮被予以滞留。2011年1月24日发现该轮在未解除滞留手续、未办理船舶出港签\",\"YiJu\":\"\"},{\"ID\":\"12\",\"ChuanMing\":\"港盛8号\",\"Info\":\"\",\"ChuanJiGang\":\"万州\",\"Type\":\"滚装客船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"2010年12月21日，广州南沙海事处对其进行检查不能提供相关证件，2010年12月22日，在未按规定办理船舶签证手续的情况下擅自离开南沙水域。\",\"YiJu\":\"\"},{\"ID\":\"11\",\"ChuanMing\":\"粤清远货2199\",\"Info\":\"\",\"ChuanJiGang\":\"清远\",\"Type\":\"散货船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"2010年10月18日上午，我局现场执法人员在唐家金星门水域巡航检查时发现\"粤清远货2199\"船无任何船舶证书、船员证书和文书，执法人员对其进行调查取证后通知其到唐家海事处办理船舶签证手续及处理，但船舶在未办理进\",\"YiJu\":\"\"},{\"ID\":\"10\",\"ChuanMing\":\"粤韶关货0298\",\"Info\":\"\",\"ChuanJiGang\":\"韶关\",\"Type\":\"散货船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"2010年10月18日上午，我局现场执法人员在唐家金星门水域巡航检查时发现\"粤韶关货0298\"船无任何船舶证书、船员证书和文书，执法人员对其进行调查取证后通知其到唐家海事处办理船舶签证手续及处理，但船舶在未办理进\",\"YiJu\":\"\"},{\"ID\":\"9\",\"ChuanMing\":\"粤韶关货0022\",\"Info\":\"\",\"ChuanJiGang\":\"韶关\",\"Type\":\"散货船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"2010年10月18日上午，我局现场执法人员在唐家金星门水域巡航检查时发现\"粤韶关货0022船无任何船舶证书、船员证书和文书，执法人员对其进行调查取证后通知其到唐家海事处办理船舶签证手续及处理，但船舶在未办理进出\",\"YiJu\":\"\"},{\"ID\":\"8\",\"ChuanMing\":\"粤清远货1337\",\"Info\":\"\",\"ChuanJiGang\":\"清远\",\"Type\":\"散货船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"船舶违法，详见佛海船舶协查[2010]001号\",\"YiJu\":\"\"},{\"ID\":\"7\",\"ChuanMing\":\"粤阳山货2039\",\"Info\":\"\",\"ChuanJiGang\":\"清远\",\"Type\":\"散货船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"船舶违法，详见佛海船舶协查[2010]001号\",\"YiJu\":\"\"},{\"ID\":\"3\",\"ChuanMing\":\"浙岭机823\",\"Info\":\"总吨：39997净吨：23363船宽：32.30米型深：18.92米总长：223.02米建造日期：1977年\",\"ChuanJiGang\":\"台州\",\"Type\":\"散货船\",\"Owner\":\"不详\",\"GenZhongYuanyin\":\"各海事管理机构发现该轮后应暂缓办理该轮的出港手续，并报广东海事局船舶处。\",\"YiJu\":\"海船舶协查[2007]004号\"},{\"ID\":\"1\",\"ChuanMing\":\"船名\",\"Info\":\"船舶概况\",\"ChuanJiGang\":\"国籍/船籍港\",\"Type\":\"船舶种类\",\"Owner\":\"船舶所有人/经营人\",\"GenZhongYuanyin\":\"协查原因及协查要求\",\"YiJu\":\"协查依据\"}],\"page\": [{\"总记录\":\"9\",\"总页数\":\"1\",\"当前页\":\"1\"}]}";
    NSDictionary *resultsDictionary = [jsonString objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
    if (resultsDictionary==nil) {
        NSLog(@"empty");
    }
    return resultsDictionary;
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
    NSLog(@"%@",jsonString);
   // NSString *demoString=@"{\"datalist\":[{\"ID\":\"13\",\"ChuanMing\":\"浙定39136\",\"Info\":\"\",\"ChuanJiGang\":\"舟山\",\"Type\":\"干货船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"2010年12月28日，汕头海事局执法人员对\"浙定39136\"实施安全检查，发现船舶存在船舶舱口围壁破损、缺货舱舱口盖、配员不足等严重缺陷，该轮被予以滞留。2011年1月24日发现该轮在未解除滞留手续、未办理船舶出港签\",\"YiJu\":\"\"},{\"ID\":\"12\",\"ChuanMing\":\"港盛8号\",\"Info\":\"\",\"ChuanJiGang\":\"万州\",\"Type\":\"滚装客船\",\"Owner\":\"\",\"GenZhongYuanyin\":\"2010年12月21日，广州南沙海事处对其进行检查不能提供相关证件，2010年12月22日，在未按规定办理船舶签证手续的情况下擅自离开南沙水域。\",\"YiJu\":\"\"},{\"ID\":\"3\",\"ChuanMing\":\"浙岭机823\",\"Info\":\"总吨：39997净吨：23363船宽：32.30米型深：18.92米总长：223.02米建造日期：1977年\",\"ChuanJiGang\":\"台州\",\"Type\":\"散货船\",\"Owner\":\"不详\",\"GenZhongYuanyin\":\"各海事管理机构发现该轮后应暂缓办理该轮的出港手续，并报广东海事局船舶处。\",\"YiJu\":\"海船舶协查[2007]004号\"},{\"ID\":\"1\",\"ChuanMing\":\"船名\",\"Info\":\"船舶概况\",\"ChuanJiGang\":\"国籍/船籍港\",\"Type\":\"船舶种类\",\"Owner\":\"船舶所有人/经营人\",\"GenZhongYuanyin\":\"协查原因及协查要求\",\"YiJu\":\"协查依据\"}],\"page\": [{\"总记录\":\"9\",\"总页数\":\"1\",\"当前页\":\"1\"}]}";
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resultsDictionary = [jsonData objectFromJSONData];

   //NSDictionary *resultsDictionary = [jsonString objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
//    NSDictionary* json = [NSJSONSerialization
//                          JSONObjectWithData:responseData
//                          options:NSJSONReadingAllowFragments
//                          error:&error];
    
    if (resultsDictionary==nil) {
        NSLog(@"empty");
    }
    return resultsDictionary;
}
-(NSDictionary*)LoadDetailAtPage:(int)type :(NSString*)idNumber
{
    NSString *typeString=nil;
    switch (type) {
        case 0:
        {
            typeString=@"";
        }
            break;
        case 1:
        {
            typeString=@"";
        }
            break;
        case 2:
        {
            typeString=@"";
        }
            break;
        case 3:
        {
            typeString=@"";
        }
            break;
        case 4:
        {
            typeString=@"";
        }
            break;
        case 5:
        {
            typeString=@"";
        }
            break;
        case 6:
        {
            typeString=@"";
        }
            break;
        case 7:
        {
            typeString=@"";
        }
            break;
        case 8:
        {
            typeString=@"";
        }
            break;
        case 9:
        {
            typeString=@"";
        }
            break;
        case 10:
        {
            typeString=@"";
        }
            break;
        case 11:
        {
            typeString=@"";
        }
            break;
        case 12:
        {
            typeString=@"";
        }
            break;
        case 13:
        {
            typeString=@"";
        }
            break;
    }
    NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/ios/getDataDetail.asp?type=%@&ID=%@",typeString,idNumber];
    // NSString *urlString =[NSString stringWithFormat:@"http://cd.douho.net/ajax/init.aspx?action=initAll&app=0"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[self getEncodedString:urlString]]];
    [request setHTTPMethod:@"POST"];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    //针对NSData数据
    NSMutableString *responseString=[[NSMutableString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSString *JSONString = [responseString substringWithRange:NSMakeRange(1, responseString.length-2)];
   // NSLog(JSONString);

    NSData* jsonData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *resultsDictionary = [jsonData objectFromJSONData];
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
