//
//  HaishijuCxcbDetailViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuAqcxczDetailViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuAqcxczDetailViewController ()

@end

@implementation HaishijuAqcxczDetailViewController
@synthesize username,department,ID,tableView,customNavBar;

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
    NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataDetail.asp?type=aqcxcz&ID=%@",chuanID];
    NSDictionary *tmpDic=[NSDictionary dictionaryWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    if (tmpDic!=nil)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSArray *infoArray=[tmpDic objectForKey:@"datalist"];
            NSDictionary *infoDic=[infoArray objectAtIndex:0];
            self.ID=[chuanID intValue];
                       dispatch_async(dispatch_get_main_queue(), ^{
                           //根据要显示的数据修改
                           self.username=[infoDic objectForKey:@"username"];
                           self.department=[infoDic objectForKey:@"department"];
                           [self.tableView reloadData];
            });
            
        });
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"错误" message:@"服务器无法连接，请稍后再试" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alert show];
    }

   }
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //根据要显示的数据的行数修改
    return 2;
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
    UIFont *font = [UIFont fontWithName:@"Arial" size:15];
    switch (indexPath.row) {
            //下面所有的CASE中都含有两个label，前面的是参数名，后面的是参数值，根据实际需要修改
               case 0:
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
        case 1:
        {
            UILabel *chuanjigangTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
            chuanjigangTitle.text=@"单位：";
            chuanjigangTitle.textColor=[UIColor blackColor];
            UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 10, 250, 30)];
            chuanjigangLabel.textColor=[UIColor blueColor];
            chuanjigangLabel.numberOfLines=0;
            chuanjigangTitle.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
            chuanjigangLabel.font=chuanjigangTitle.font=font;
            chuanjigangLabel.text=[NSString stringWithFormat:@"%@",self.department];
            [cell addSubview:chuanjigangTitle];
            [cell addSubview:chuanjigangLabel];

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
