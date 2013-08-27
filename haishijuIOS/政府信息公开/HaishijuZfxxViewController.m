//
//  HaishijuCxcbViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuZfxxViewController.h"
#import "HaishijuServerHelper.h"
#import <QuartzCore/QuartzCore.h>
#import "HaishijuZfxxDetailViewController.h"
#import "HaishijuZfxxChildViewController.h"
@interface HaishijuZfxxViewController ()

@end

@implementation HaishijuZfxxViewController
@synthesize tableView,customNavBar,alert;
@synthesize zfxxListViewController,requisitionFirstViewController;

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
    objectsArray=[[NSMutableArray alloc] initWithObjects:@"政府信息公开指南",@"政府信息公开目录",@"信息公开年报",@"信息公开申请", nil];
    muluArray=[[NSMutableArray alloc] initWithObjects:@"组织机构",@"海事行政处罚",@"海事项目",@"干部任免",@"人事管理",@"年度计划",@"海事行政许可",@"听证与复议",@"海事规费", nil];
 
    if ([[UIScreen mainScreen] bounds].size.height>480.00)
    {
           self.zfxxListViewController=[[HaishijuZfxxListViewController alloc] initWithNibName:@"HaishijuZfxxListViewController_4" bundle:nil];
            self.requisitionFirstViewController=[[HaishijuRequisitionFirstViewController alloc] initWithNibName:@"HaishijuRequisitionFirstViewController_4" bundle:nil];
    }
    else
    {
                   self.zfxxListViewController=[[HaishijuZfxxListViewController alloc] initWithNibName:@"HaishijuZfxxListViewController" bundle:nil];
            self.requisitionFirstViewController=[[HaishijuRequisitionFirstViewController alloc] initWithNibName:@"HaishijuRequisitionFirstViewController" bundle:nil];
    }

    //根据接口文档改写一下数组路面的objects，以下分别对应文档中的中文说明和字段
    self.navigationController.navigationBarHidden=YES;
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"listViewBG"]];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int number;
    switch (section) {
        case 0:
        {
            number=1;
        }
            break;
        case 1:
        {
            number=9;
        }
            break;
        case 2:
        {
            number=1;
        }
            break;
        case 3:
        {
            number=3;
        }
            break;
    }
    return number;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [objectsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"%@",[objectsArray objectAtIndex:section]];
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }else
        return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier]
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    switch (indexPath.section) {
        case 0:
        {
            UIFont *font = [UIFont fontWithName:@"Arial" size:16];
            UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
            firstTitle.backgroundColor=[UIColor clearColor];
            firstTitle.font=font;
            firstTitle.text=[NSString stringWithFormat:@"  %@",[objectsArray objectAtIndex:indexPath.section]];
            [cell addSubview:firstTitle];

        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 1:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 2:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 3:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 4:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 5:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 6:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 7:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 8:
                {
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font= [UIFont fontWithName:@"Arial" size:14];
                    firstTitle.text=[NSString stringWithFormat:@"        %@",[muluArray objectAtIndex:indexPath.row]];
                    [cell addSubview:firstTitle];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            UIFont *font = [UIFont fontWithName:@"Arial" size:16];
            UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
            firstTitle.backgroundColor=[UIColor clearColor];
            firstTitle.font=font;
            firstTitle.text=[NSString stringWithFormat:@"  %@",[objectsArray objectAtIndex:indexPath.section]];
            [cell addSubview:firstTitle];

        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:
                {
                    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font=font;
                    firstTitle.text=[NSString stringWithFormat:@"  申请指南"];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 1:
                {
                    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font=font;
                    firstTitle.text=[NSString stringWithFormat:@"  在线申请"];
                    [cell addSubview:firstTitle];
                }
                    break;
                case 2:
                {
                    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
                    UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,  cell.frame.size.height)];
                    firstTitle.backgroundColor=[UIColor clearColor];
                    firstTitle.font=font;
                    firstTitle.text=[NSString stringWithFormat:@"  受理情况"];
                    [cell addSubview:firstTitle];
                }
                    break;
            }

        }
            break;
    }
        
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
    switch (indexPath.section) {
        case 0:
        {
            HaishijuZfxxDetailViewController *zfxxDetailViewController=[HaishijuZfxxDetailViewController shareHaishijuZfxxDetailViewController];
            [self.navigationController pushViewController:zfxxDetailViewController animated:YES];
            [zfxxDetailViewController loadInfoBySendRequest:@"4844"];
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    //组织机构
                    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:@"选择栏目" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"组织机构",@"领导动态", nil];
                    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
                    [actionSheet showInView:self.view];
                    
                }
                    break;
                case 1:
                {
                    [self.navigationController pushViewController:self.zfxxListViewController animated:YES];
                    [self.zfxxListViewController.listTitle setText:@"海事行政处罚"];
                    [self.zfxxListViewController loadListBy:@"8"];
                }
                    break;
                case 2:
                {
                    HaishijuZfxxChildViewController *zfxxChildViewController=[HaishijuZfxxChildViewController shareHaishijuZfxxChildViewController];
                    [self.navigationController pushViewController:zfxxChildViewController animated:YES];
                    [zfxxChildViewController loadListByParentID:@"10"];
                }
                    break;
                case 3:
                {
                    [self.navigationController pushViewController:self.zfxxListViewController animated:YES];
                    [self.zfxxListViewController.listTitle setText:@"干部任免"];
                    [self.zfxxListViewController loadListBy:@"675"];
                }
                    break;
                case 4:
                {
                    [self.navigationController pushViewController:self.zfxxListViewController animated:YES];
                    [self.zfxxListViewController.listTitle setText:@"人事管理"];
                    [self.zfxxListViewController loadListBy:@"12"];
                }
                    break;
                case 5:
                {
                    [self.navigationController pushViewController:self.zfxxListViewController animated:YES];
                    [self.zfxxListViewController.listTitle setText:@"年度计划"];
                    [self.zfxxListViewController loadListBy:@"676"];
                }
                    break;
                case 6:
                {
                    HaishijuZfxxDetailViewController *zfxxDetailViewController=[HaishijuZfxxDetailViewController shareHaishijuZfxxDetailViewController];
                    [self.navigationController pushViewController:zfxxDetailViewController animated:YES];
                    [zfxxDetailViewController loadInfoBySendRequest:@"341"];

                }
                    break;
                case 7:
                {
                    HaishijuZfxxDetailViewController *zfxxDetailViewController=[HaishijuZfxxDetailViewController shareHaishijuZfxxDetailViewController];
                    [self.navigationController pushViewController:zfxxDetailViewController animated:YES];
                    [zfxxDetailViewController loadInfoBySendRequest:@"344"];

                }
                    break;
                case 8:
                {
                    HaishijuZfxxDetailViewController *zfxxDetailViewController=[HaishijuZfxxDetailViewController shareHaishijuZfxxDetailViewController];
                    [self.navigationController pushViewController:zfxxDetailViewController animated:YES];
                    [zfxxDetailViewController loadInfoBySendRequest:@"371"];

                }
                    break;
            }
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:self.zfxxListViewController animated:YES];
            [self.zfxxListViewController.listTitle setText:@"信息公开年报表"];
            [self.zfxxListViewController loadListBy:@"81"];
        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:
                {
                    HaishijuZfxxDetailViewController *zfxxDetailViewController=[HaishijuZfxxDetailViewController shareHaishijuZfxxDetailViewController];
                    [self.navigationController pushViewController:zfxxDetailViewController animated:YES];
                    [zfxxDetailViewController loadInfoBySendRequest:@"18732"];
                }
                    break;
                case 1:
                {
                    [self.navigationController pushViewController:self.requisitionFirstViewController animated:YES];
                }
                    break;
                case 2:
                {
                    [self.navigationController pushViewController:self.zfxxListViewController animated:YES];
                    [self.zfxxListViewController.listTitle setText:@"受理情况"];
                    [self.zfxxListViewController loadListBy:@"804"];
                }
                    break;
            }
        }
            break;
    }

}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:{
                [self.navigationController pushViewController:self.zfxxListViewController animated:YES];
                [self.zfxxListViewController.listTitle setText:@"组织机构"];
                [self.zfxxListViewController loadListBy:@"5"];

        }
            break;
            
            case 1:
        {
            HaishijuZfxxChildViewController *zfxxChildViewController=[HaishijuZfxxChildViewController shareHaishijuZfxxChildViewController];
            [self.navigationController pushViewController:zfxxChildViewController animated:YES];
            [zfxxChildViewController loadListByParentID:@"5"];
        }
            break;
            
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
