//
//  HaishijuCxcbDetailViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuZfzcxDetailViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuZfzcxDetailViewController ()

@end

@implementation HaishijuZfzcxDetailViewController
@synthesize username,sex,department,zfz_date,zfz_num,zfz_yx,ID,tableView,customNavBar;

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
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataDetail.asp?type=jfryjf&ID=%@",chuanID];
    NSDictionary *tmpDic=[NSDictionary dictionaryWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    NSArray *infoArray=[tmpDic objectForKey:@"datalist"];
    NSDictionary *infoDic=[infoArray objectAtIndex:0];
    self.ID=[chuanID intValue];
    self.username=[infoDic objectForKey:@"username"];
    self.sex=[infoDic objectForKey:@"sex"];
    self.department=[infoDic objectForKey:@"department"];
    self.zfz_num=[infoDic objectForKey:@"zfz_num"];
    self.zfz_date=[infoDic objectForKey:@"zfz_date"];
    self.zfz_yx=[infoDic objectForKey:@"zfz_yx"];
    [self.tableView reloadData];
}
-(void)setInfoByUsername:(NSString*)chuanID :(NSString*)chuanusername :(NSString*)chuansex :(NSString*)chuandepartment :(NSString*)chuanzfz_num :(NSString*)chuanzfz_date :(NSString*)chuanzfz_yx;
{
    self.ID=[chuanID intValue];
    self.username=[NSString stringWithFormat:@"%@",chuanusername];
    self.sex=[NSString stringWithFormat:@"%@",chuansex];
    self.department=[NSString stringWithFormat:@"%@",chuandepartment];
    self.zfz_num=[NSString stringWithFormat:@"%@",chuanzfz_num];
    self.zfz_date=[NSString stringWithFormat:@"%@",chuanzfz_date];
    self.zfz_yx=[NSString stringWithFormat:@"%@",chuanzfz_yx];
    [self.tableView reloadData];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
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
            UILabel *IDTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
            IDTitle.text=@"ID：";
            IDTitle.textColor=[UIColor blackColor];
            UILabel *IDLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 10, 100, 30)];
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
            UILabel *nameTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
            nameTitle.text=@"姓名：";
            nameTitle.textColor=[UIColor blackColor];
            UILabel *chuanmingLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 10, 200, 30)];
            chuanmingLabel.textColor=[UIColor blueColor];
            chuanmingLabel.text=[NSString stringWithFormat:@"%@",self.username];
            nameTitle.backgroundColor=chuanmingLabel.backgroundColor=[UIColor clearColor];
            nameTitle.font=chuanmingLabel.font=font;
            [cell addSubview:nameTitle];
            [cell addSubview:chuanmingLabel];
        }
            break;
        case 2:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 60, 30)];
            chuanjigangTitle.text=@"性别：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 10, 200, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.sex];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];

        }
            break;
        case 3:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
            gongsiTitle.text=@"单位：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 10, 230, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.department];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];

        }
            break;
        case 4:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
            gongsiTitle.text=@"执法证编号：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 180, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.zfz_num];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 5:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 30)];
            gongsiTitle.text=@"发证日期：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 10, 160, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiTitle.numberOfLines=0;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.zfz_date];
            [cell addSubview:gongsiTitle];
            [cell addSubview:gongsiLabel];
            
        }
            break;
        case 6:
        {
            UILabel *gongsiTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
            gongsiTitle.text=@"有效期：";
            gongsiTitle.textColor=[UIColor blackColor];
            UILabel *gongsiLabel=[[UILabel alloc] initWithFrame:CGRectMake(90, 10, 200, 30)];
            gongsiLabel.textColor=[UIColor blueColor];
            gongsiTitle.backgroundColor=gongsiLabel.backgroundColor=[UIColor clearColor];
            gongsiTitle.font=gongsiLabel.font=font;
            gongsiLabel.text=[NSString stringWithFormat:@"%@",self.zfz_yx];
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
