//
//  HaishijuCxcbDetailViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuCxcbDetailViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuCxcbDetailViewController ()

@end

@implementation HaishijuCxcbDetailViewController
@synthesize chuanJiGang,chuanMing,gongSi,ID,tableView,customNavBar;

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
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataDetail.asp?type=cxcb&ID=%@",chuanID];
    NSDictionary *tmpDic=[NSDictionary dictionaryWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    NSArray *infoArray=[tmpDic objectForKey:@"datalist"];
    NSDictionary *infoDic=[infoArray objectAtIndex:0];
    self.ID=[chuanID intValue];
    self.chuanMing=[infoDic objectForKey:@"ChuanMing"];
    self.chuanJiGang=[infoDic objectForKey:@"ChuanJiGang"];
    self.gongSi=[infoDic objectForKey:@"GongSi"];
    [self.tableView reloadData];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
    switch (indexPath.row) {
        case 0:
        {
            UILabel *IDTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 15, 70, 30)];
            IDTitle.text=@"ID：";
            IDTitle.textColor=[UIColor blackColor];
            UILabel *IDLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 15, 80, 30)];
            IDLabel.textColor=[UIColor blueColor];
            IDLabel.text=[NSString stringWithFormat:@"%d",self.ID];
            IDTitle.backgroundColor=IDLabel.backgroundColor=[UIColor clearColor];
            IDTitle.font=IDLabel.font=font;
            [cell addSubview:IDTitle];
            [cell addSubview:IDLabel];
        }
            break;
        case 1:
        {
            UILabel *nameTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 15, 70, 30)];
            nameTitle.text=@"船名：";
            nameTitle.textColor=[UIColor blackColor];
            UILabel *chuanmingLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 15, 80, 30)];
            chuanmingLabel.textColor=[UIColor blueColor];
            chuanmingLabel.text=[NSString stringWithFormat:@"%@",self.chuanMing];
            nameTitle.backgroundColor=chuanmingLabel.backgroundColor=[UIColor clearColor];
            nameTitle.font=chuanmingLabel.font=font;
            [cell addSubview:nameTitle];
            [cell addSubview:chuanmingLabel];
        }
            break;
        case 2:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 15, 70, 30)];
            chuanjigangTitle.text=@"船籍港：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 15, 80, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.chuanJiGang];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];

        }
            break;
        case 3:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 15, 70, 30)];
            gongsiTitle.text=@"公司：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 15, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.gongSi];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];

        }
            break;
    }
    return cell;
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

@end
