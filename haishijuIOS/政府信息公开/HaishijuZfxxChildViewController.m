//
//  HaishijuCxcbViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuZfxxChildViewController.h"
#import "HaishijuServerHelper.h"
#import <QuartzCore/QuartzCore.h>
#import "HaishijuZfxxDetailViewController.h"
@interface HaishijuZfxxChildViewController ()

@end

@implementation HaishijuZfxxChildViewController
@synthesize tableView,customNavBar,alert;
static HaishijuZfxxChildViewController *shareHaishijuZfxxChildViewController = nil;
+(HaishijuZfxxChildViewController*)shareHaishijuZfxxChildViewController
{
    
    if (shareHaishijuZfxxChildViewController == nil) {
        shareHaishijuZfxxChildViewController = [[super allocWithZone:NULL] init];
    }
    return shareHaishijuZfxxChildViewController;
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
    objectsArray=[[NSMutableArray alloc] initWithCapacity:0];
    //根据接口文档改写一下数组路面的objects，以下分别对应文档中的中文说明和字段
    self.navigationController.navigationBarHidden=YES;
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"listViewBG"]];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}
-(void)loadListByParentID:(NSString*)parentID
{
    HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
    //修改url中的type的参数
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=class_child&classid=%@",parentID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *jsonString=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",jsonString);
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [objectsArray count];
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier]
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
    firstTitle.backgroundColor=[UIColor blueColor];
    firstTitle.font=font;
    firstTitle.text=[NSString stringWithFormat:@"  %@",[objectsArray objectAtIndex:indexPath.row]];
    [cell addSubview:firstTitle];
    return cell;
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)backToHomeAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
