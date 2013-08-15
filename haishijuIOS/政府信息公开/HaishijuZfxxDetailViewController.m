//
//  HaishijuCxcbDetailViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuZfxxDetailViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuZfxxDetailViewController ()

@end

@implementation HaishijuZfxxDetailViewController
@synthesize detailTitle,contentView,customNavBar;
static HaishijuZfxxDetailViewController *shareHaishijuZfxxDetailViewController = nil;
+(HaishijuZfxxDetailViewController*)shareHaishijuZfxxDetailViewController
{
    
    if (shareHaishijuZfxxDetailViewController == nil) {
        shareHaishijuZfxxDetailViewController = [[super allocWithZone:NULL] init];
    }
    return shareHaishijuZfxxDetailViewController;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden=YES;
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"listViewBG"]];
}
-(void)loadInfoBySendRequest:(NSString*)chuanID
{
    HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
    //修改url中的type的参数
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataDetail.asp?type=xxgk&ID=%@",chuanID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[self getEncodedString:urlString]]];
    [request setHTTPMethod:@"POST"];
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *jsonString=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSRange titleRange=[jsonString rangeOfString:@"Title"];
    NSLog(@"%d",titleRange.location);
    NSRange contentRange=[jsonString rangeOfString:@"Content"];
    NSLog(@"%d",contentRange.location);
    NSString *titleString=[jsonString substringWithRange:NSMakeRange(titleRange.location+10, contentRange.location-29)];
    NSLog(@"%@",titleString);
    NSString *contentString=[jsonString substringFromIndex:contentRange.location+10];
    contentString=[contentString substringWithRange:NSMakeRange(0, contentString.length-4)];
    NSLog(@"%@",contentString);
    self.detailTitle.text=[NSString stringWithFormat:@"%@",titleString];
    [self.contentView loadHTMLString:contentString baseURL:nil];
}

- (IBAction)backAction:(id)sender
{
   // [self.navigationController popToViewController:self.n animated:<#(BOOL)#>];
    int index=[[self.navigationController viewControllers]indexOfObject:self];
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-1]animated:YES];
    
}
- (IBAction)backToHomeAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (void)viewDidUnload {
    [self setContentView:nil];
    [self setTitle:nil];
    [self setContentView:nil];
    [super viewDidUnload];
}
@end
