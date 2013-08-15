//
//  HaishijuCxcbDetailViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuNSMDetailViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuNSMDetailViewController ()

@end

@implementation HaishijuNSMDetailViewController
@synthesize ID,tableView,customNavBar;
@synthesize No,GongSi,GetDocDate,NowDocDate,LastYearDate,chuanzhong,kegunchuan,gaosukechuan,putongkechuan,qitiyunshuchuan,huaxuepingchuan,youchuan,youhuaxueping,sanhuochuan,qitahuochuan,chuanboshuliang,guojiNUM,dangdiju;

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
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataDetail.asp?type=nsm&ID=%@",chuanID];
    NSDictionary *tmpDic=[NSDictionary dictionaryWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    NSArray *infoArray=[tmpDic objectForKey:@"datalist"];
    NSDictionary *infoDic=[infoArray objectAtIndex:0];
    self.ID=[chuanID intValue];
    self.No=[infoDic objectForKey:@"NO"];
    self.GongSi=[infoDic objectForKey:@"GongSi"];
    self.GetDocDate=[infoDic objectForKey:@"GetDocDate"];
    self.NowDocDate=[infoDic objectForKey:@"NowDocDate"];
    self.LastYearDate=[infoDic objectForKey:@"LastYearDate"];
    self.chuanzhong=[infoDic objectForKey:@"chuanzhong"];
    self.kegunchuan=[infoDic objectForKey:@"kegunchuan"];
    self.gaosukechuan=[infoDic objectForKey:@"gaosukechuan"];
    self.putongkechuan=[infoDic objectForKey:@"putongkechuan"];
    self.qitiyunshuchuan=[infoDic objectForKey:@"qitiyunshuchuan"];
    self.huaxuepingchuan=[infoDic objectForKey:@"huaxuepingchuan"];
    self.youchuan=[infoDic objectForKey:@"youchuan"];
    self.youhuaxueping=[infoDic objectForKey:@"youhuaxueping"];
    self.sanhuochuan=[infoDic objectForKey:@"sanhuochuan"];
    self.qitahuochuan=[infoDic objectForKey:@"qitahuochuan"];
    self.chuanboshuliang=[infoDic objectForKey:@"chuanboshuliang"];
    self.guojiNUM=[infoDic objectForKey:@"guojiNUM"];
    self.dangdiju=[infoDic objectForKey:@"dangdiju"];
    [self.tableView reloadData];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 19;
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
            UILabel *nameTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
            nameTitle.text=@"证书号：";
            nameTitle.textColor=[UIColor blackColor];
            UILabel *chuanmingLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 10, 200, 30)];
            chuanmingLabel.textColor=[UIColor blueColor];
            chuanmingLabel.text=[NSString stringWithFormat:@"%@",self.No];
            nameTitle.backgroundColor=chuanmingLabel.backgroundColor=[UIColor clearColor];
            nameTitle.font=chuanmingLabel.font=font;
            [cell addSubview:nameTitle];
            [cell addSubview:chuanmingLabel];
        }
            break;
        case 2:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 30)];
            chuanjigangTitle.text=@"公司名称：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 10, 210, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.GongSi];
            chuanjigangTitle.font=chuanjigangLabel.font=font;
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];
            
        }
            break;
        case 3:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 160, 30)];
            gongsiTitle.text=@"初次获得DOC日期：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(180, 10, 140, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.GetDocDate];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 4:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
            gongsiTitle.text=@"现有DOC有效期：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 180, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.NowDocDate];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 5:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 30)];
            gongsiTitle.text=@"最后一次年度签注日期：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 10, 120, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiTitle.numberOfLines=0;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.LastYearDate];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 6:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
            gongsiTitle.text=@"船种：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.chuanzhong];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
        }
            break;
        case 7:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"客滚船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.kegunchuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 8:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"高速客船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.gaosukechuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 9:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 130, 30)];
            gongsiTitle.text=@"普通客船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(150, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.putongkechuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 10:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 130, 30)];
            gongsiTitle.text=@"气体运输船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(150, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.qitiyunshuchuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 11:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"化学品船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.huaxuepingchuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 12:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"油船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.youchuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 13:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"油船/化学品船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.youhuaxueping];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 14:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"散货船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.sanhuochuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 15:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"其他货船：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.qitahuochuan];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 16:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"船舶数量：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.chuanboshuliang];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 17:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 160, 30)];
            gongsiTitle.text=@"国际复合证明编号：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(180, 10, 140, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.guojiNUM];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 18:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"当地局：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.dangdiju];
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
