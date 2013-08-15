//
//  HaishijuCxcbDetailViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuHccyDetailViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuHccyDetailViewController ()

@end

@implementation HaishijuHccyDetailViewController
@synthesize ID,tableView,customNavBar;
@synthesize jigong,jigou,B01,B02,B03,B04,B05,B06,B07,B08,B09,A01,A02,A03,A04,A05,A06,A07,A08,A09,A10,A11,C07,sanfu,sanguang,shuishou,youting,chuanzhang,dafu,lunjizhang,daguanglun;

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
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataDetail.asp?type=pxjg&ID=%@",chuanID];
    NSDictionary *tmpDic=[NSDictionary dictionaryWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    NSArray *infoArray=[tmpDic objectForKey:@"datalist"];
    NSDictionary *infoDic=[infoArray objectAtIndex:0];
    self.ID=[chuanID intValue];
    self.jigou=[infoDic objectForKey:@"jigou"];
    self.B01=[infoDic objectForKey:@"B01"];
    self.B02=[infoDic objectForKey:@"B02"];
    self.B03=[infoDic objectForKey:@"B03"];
    self.B04=[infoDic objectForKey:@"B04"];
    self.B05=[infoDic objectForKey:@"B05"];
    self.B06=[infoDic objectForKey:@"B06"];
    self.B07=[infoDic objectForKey:@"B07"];
    self.B08=[infoDic objectForKey:@"B08"];
    self.B09=[infoDic objectForKey:@"B09"];
    self.A01=[infoDic objectForKey:@"A01"];
    self.A02=[infoDic objectForKey:@"A02"];
    self.A03=[infoDic objectForKey:@"A03"];
    self.A04=[infoDic objectForKey:@"A04"];
    self.A05=[infoDic objectForKey:@"A05"];
    self.A06=[infoDic objectForKey:@"A06"];
    self.A07=[infoDic objectForKey:@"A07"];
    self.A08=[infoDic objectForKey:@"A08"];
    self.A09=[infoDic objectForKey:@"A09"];
    self.A10=[infoDic objectForKey:@"A10"];
    self.A11=[infoDic objectForKey:@"A11"];
    self.C07=[infoDic objectForKey:@"C07"];
    self.shuishou=[infoDic objectForKey:@"shuishou"];
    self.jigong=[infoDic objectForKey:@"jigong"];
    self.sanfu=[infoDic objectForKey:@"sanfu"];
    self.sanguang=[infoDic objectForKey:@"sanguang"];
    self.youting=[infoDic objectForKey:@"youting"];
    self.chuanzhang=[infoDic objectForKey:@"chuanzhang"];
    self.dafu=[infoDic objectForKey:@"dafu"];
    self.lunjizhang=[infoDic objectForKey:@"lunjizhang"];
    self.daguanglun=[infoDic objectForKey:@"daguanglun"];
    [self.tableView reloadData];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 32;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
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
            UILabel *IDTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 40, 30)];
            IDTitle.text=@"ID：";
            IDTitle.textColor=[UIColor blackColor];
            UILabel *IDLabel=[[UILabel alloc] initWithFrame:CGRectMake(60, 10, 80, 30)];
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
            UILabel *nameTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            nameTitle.text=@"机构名称：";
            nameTitle.textColor=[UIColor blackColor];
            UIFont *font1= [UIFont fontWithName:@"Arial" size:14];
            UILabel *chuanmingLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            chuanmingLabel.textColor=[UIColor blueColor];
            chuanmingLabel.text=[NSString stringWithFormat:@"%@",self.jigou];
            nameTitle.backgroundColor=chuanmingLabel.backgroundColor=[UIColor clearColor];
            nameTitle.font=font;
            chuanmingLabel.font=font1;
            [cell addSubview:nameTitle];
            [cell addSubview:chuanmingLabel];
        }
            break;
        case 2:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B01：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B01];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];

        }
            break;
        case 3:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B02：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B02];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 4:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B03：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B03];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 5:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B04：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B04];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 6:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B05：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B05];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 7:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B06：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B06];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 8:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B07：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B07];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 9:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B08：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B08];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 10:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"B09：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.B09];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 11:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A01：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A01];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 12:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A02：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A02];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 13:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A03：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A03];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 14:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A04：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A04];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 15:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A05：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A05];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 16:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A06：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A06];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 17:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A07：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A07];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 18:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A08：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A08];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 19:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A09：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A09];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 20:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A10：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A10];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 21:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            chuanjigangTitle.text=@"A11：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.A11];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 22:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"值班水手：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.shuishou];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 23:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"值班机工：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.jigong];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 24:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"甲类三副：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.sanfu];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 25:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"甲类三管：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.sanfu];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 26:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            gongsiTitle.text=@"游艇操作人员：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 160, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.youting];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 27:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
            gongsiTitle.text=@"船长：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 10,230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.chuanzhang];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 28:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"大副：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.dafu];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 29:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"轮机长：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.lunjizhang];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 30:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"大管轮：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.daguanglun];
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
