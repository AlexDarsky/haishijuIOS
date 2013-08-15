//
//  HaishijuCxcbDetailViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuISMDetailViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuISMDetailViewController ()

@end

@implementation HaishijuISMDetailViewController
@synthesize no,GongSi,DOC,DOCgs,DOChx,DOCkc,DOCpt,DOCq,DOCqt,DOCsh,DOCyc,SMC,SMCyc,SMCsh,SMCqt,SMCq,SMCpt,SMCkc,SMChx,SMCgs,ID,Info;

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
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataDetail.asp?type=ims&ID=%@",chuanID];
    NSDictionary *tmpDic=[NSDictionary dictionaryWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    NSArray *infoArray=[tmpDic objectForKey:@"datalist"];
    NSDictionary *infoDic=[infoArray objectAtIndex:0];
    self.ID=[chuanID intValue];
    self.no=[infoDic objectForKey:@"NO"];
    self.GongSi=[infoDic objectForKey:@"GongSi"];
    self.DOCkc=[infoDic objectForKey:@"DOCkc"];
    self.SMCkc=[infoDic objectForKey:@"SMCkc"];
    self.DOCgs=[infoDic objectForKey:@"DOCgs"];
    self.SMCgs=[infoDic objectForKey:@"SMCgs"];
    self.DOCpt=[infoDic objectForKey:@"DOCpt"];
    self.SMCpt=[infoDic objectForKey:@"SMCpt"];
    self.DOCqt=[infoDic objectForKey:@"DOCqt"];
    self.SMCqt=[infoDic objectForKey:@"SMCqt"];
    self.DOChx=[infoDic objectForKey:@"DOChx"];
    self.SMChx=[infoDic objectForKey:@"SMChx"];
    self.DOCyc=[infoDic objectForKey:@"DOCyc"];
    self.SMCyc=[infoDic objectForKey:@"SMCyc"];
    self.DOCsh=[infoDic objectForKey:@"DOCsh"];
    self.SMCsh=[infoDic objectForKey:@"SMCsh"];
    self.DOCq=[infoDic objectForKey:@"DOCq"];
    self.SMCq=[infoDic objectForKey:@"SMCq"];
    self.DOC=[infoDic objectForKey:@"DOC"];
    self.SMC=[infoDic objectForKey:@"SMC"];
    self.Info=[infoDic objectForKey:@"Info"];
    [self.tableView reloadData];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 22;
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
    UIFont *font = [UIFont fontWithName:@"Arial" size:14];
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
            chuanmingLabel.text=[NSString stringWithFormat:@"%@",self.no];
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
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"客滚船(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 180, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOCkc];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];

        }
            break;
        case 4:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"客滚船(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 180, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMCkc];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 5:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"高速客船(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 170, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiTitle.numberOfLines=0;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOCgs];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 6:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"高速客船(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMCgs];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 7:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"普通客串(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOCpt];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
                        break;
        case 8:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"普通客串(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMCpt];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 9:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 130, 30)];
            gongsiTitle.text=@"气体运输船(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(150, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOCqt];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 10:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 130, 30)];
            gongsiTitle.text=@"气体运输船(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(150, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMCqt];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 11:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"化学品船(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOChx];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 12:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"化学品船(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMChx];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 13:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"游船(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOCyc];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 14:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"游船(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMCyc];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 15:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"散货船(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOCsh];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 16:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"散货船(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMCsh];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 17:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"其他货船(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOCq];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 18:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            gongsiTitle.text=@"其他货船(SMC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMCq];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 19:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"合计(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.DOC];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 20:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"合计(DOC)：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.SMC];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 21:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
            gongsiTitle.text=@"备注：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiLabel.numberOfLines=0;
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.Info];
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
