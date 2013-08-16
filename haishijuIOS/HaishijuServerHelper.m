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
  //  NSString *demoString=@"{\"datalist\": [{\"ID\":\"19\",\"Gname\":\"吴川市广航船务有限公司\",\"Info\":\"2012年3月9日，公司所管理“梅航899”轮（总吨299）在接受广州海事局安全检查中，发现缺一名三副和一名轮机员；消防泵压力过低不能出水。2012年3月14日，公司所管理“梅航108 ”轮（总吨457）在接受东莞海事局安全检查中，发现缺少三副、GMDSS操作员、轮机员各1名及水手2名；消防泵管系堵塞；未配备预定航程海图。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"18\",\"Gname\":\"广东金东海集团有限公司\",\"Info\":\"2012年4月24日，珠海海事局检查公司所管理“汕航工08”（总吨387），发现缺少三副和三管轮各1名。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"17\",\"Gname\":\"阳西县溪头客运机渡发展有限公司\",\"Info\":\"2012年4月23日，公司所管理“溪头机渡”轮（总吨28）在接受阳江海事局安全检查中，发现缺少一名值班水手。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"16\",\"Gname\":\"广州市仕泰海运有限公司\",\"Info\":\"2012年3月13日，公司所管理“阳海航388”轮（总吨1251）在接受江门海事局安全检查中，发现缺一名驾驶和一名水手。\",\"IsDOC\":\"是\",\"remark\":\"“阳海航388”轮不属于强制实施NSM规则船舶，不持公司DOC副本。\"},{\"ID\":\"15\",\"Gname\":\"电白县蓝凤凰旅业有限公司\",\"Info\":\"2012年4月23日，公司所管理“蓝凤凰18号”轮（总吨137）在接受茂名海事局安全检查中，发现缺一名水手；最低配员证书不在船保存。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"14\",\"Gname\":\"广州广船国际股份有限公司\",\"Info\":\"2012年4月12日，公司所管理“广船拖5”轮（总吨137）在接受珠海海事局安全检查中，发现缺三管轮、值班水手、值班机工各一名。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"13\",\"Gname\":\"湛江市祥春顺发船务有限公司\",\"Info\":\"2012年3月16日，公司所管理“祥春198”轮（总吨499）在接\345\217\227惠州海事局安全检查中，发现缺GMDSS操作员一名；主甲板一消防箱无消防水带 ；桅杆处航行灯不亮。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"12\",\"Gname\":\"吴川市荟通船务有限公司\",\"Info\":\"2012年3月16日，公司所管理“荟通116”轮（总吨499）在接受东莞海事局安全检查中，发现缺二副一名。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"11\",\"Gname\":\"湛江市梅航船务有限公司\",\"Info\":\"2012年3月9日，公司所管理“梅航863”轮（总吨496）在接受东莞海事局安全检查中，发现缺少水手1名。\",\"IsDOC\":\"否\",\"remark\":\"\"},{\"ID\":\"10\",\"Gname\":\"汕头市福顺船务有限公司\",\"Info\":\"2012年3月14日，公司所管理“梅航108 ”轮（总吨457）在接受东莞海事局安全检查中，发现缺少三副、GMDSS操作员、轮机员各1名及水手2名；消防泵管系堵塞；未配备预定航程海图。\",\"IsDOC\":\"是\",\"remark\":\"“福顺528”轮不属于强制实施NSM规则船舶，不持公司DOC副本。\"}],\"page\": [{\"总记录\":\"10\",\"总页数\":\"1\",\"当前页\":\"1\"}]}";
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
