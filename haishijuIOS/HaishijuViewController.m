//
//  HaishijuViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuViewController.h"
#import "HaishijuServerHelper.h"
#import "HaishijuCxcbViewController.h"
@interface HaishijuViewController ()

@end

@implementation HaishijuViewController
@synthesize tableView,customNavBar,customSearBar;
@synthesize zfxxViewController,cxcbViewController,gzcbViewController,zfzcxViewController,xccbViewController,cbshViewController,iSMViewController,hccyViewController,nSMViewController,zdgzViewController,nhcyViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    modelArray=[[NSMutableArray alloc] initWithObjects:@"政府信息公开",@"安全诚信船舶名单",@"重点跟踪船舶名单",@"协查船舶名单",@"船舶审核管理",@"实施ISM公司",@"海船船员培训机构查询",@"实施NSM公司",@"重点跟踪公司",@"内河船员培训机构查询", @"执法人员执法证查询",@"“安全诚信船长”名单",@"甲、乙级海船船员服务机构查询",@"海员外派机构查询",@"船舶安检员信息查询", nil];
    imagesArray=[[NSMutableArray alloc] initWithObjects:@"zfxx",@"aqcxcb",@"zdgzcbmd",@"xccbmd",@"cbsh",@"ssISMgs",@"hccy",@"ssNSMgs",@"zdzz",@"nhcy",@"zfry",@"aqcxcz",@"jyjcy",@"hywp", @"cyckscj",nil];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"mainBG"]];
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.customSearBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"searchBar"]];
    if ([[UIScreen mainScreen] bounds].size.height>480.00)
    {
        self.zfxxViewController=[[HaishijuZfxxViewController alloc] initWithNibName:@"HaishijuZfxxViewController_4" bundle:nil];
        self.cxcbViewController=[[HaishijuCxcbViewController alloc] initWithNibName:@"HaishijuCxcbViewController_4" bundle:nil];
        self.gzcbViewController=[[HaishijuGzcbViewController alloc] initWithNibName:@"HaishijuGzcbViewController_4" bundle:nil];
        self.xccbViewController=[[HaishijuXccbViewController alloc] initWithNibName:@"HaishijuXccbViewController_4" bundle:nil];
        self.cbshViewController=[[HaishijuCbshViewController alloc] initWithNibName:@"HaishijuCbshViewController_4" bundle:nil];
        self.iSMViewController=[[HaishijuISMViewController alloc] initWithNibName:@"HaishijuISMViewController_4" bundle:nil];
        self.hccyViewController=[[HaishijuHccyViewController alloc] initWithNibName:@"HaishijuHccyViewController_4" bundle:nil];
        self.nSMViewController=[[HaishijuNSMViewController alloc] initWithNibName:@"HaishijuNSMViewController_4" bundle:nil];
        self.zdgzViewController=[[HaishijuZdgzViewController alloc] initWithNibName:@"HaishijuZdgzViewController_4" bundle:nil];
        self.nhcyViewController=[[HaishijuNhcyViewController alloc] initWithNibName:@"HaishijuNhcyViewController_4" bundle:nil];
        self.zfzcxViewController=[[HaishijuZfzcxViewController alloc] initWithNibName:@"HaishijuZfzcxViewController_4" bundle:nil];

    }
    else
    {
        self.zfxxViewController=[[HaishijuZfxxViewController alloc] initWithNibName:@"HaishijuZfxxViewController" bundle:nil];
        self.cxcbViewController=[[HaishijuCxcbViewController alloc] initWithNibName:@"HaishijuCxcbViewController" bundle:nil];
        self.gzcbViewController=[[HaishijuGzcbViewController alloc] initWithNibName:@"HaishijuGzcbViewController" bundle:nil];
        self.xccbViewController=[[HaishijuXccbViewController alloc] initWithNibName:@"HaishijuXccbViewController" bundle:nil];
        self.cbshViewController=[[HaishijuCbshViewController alloc] initWithNibName:@"HaishijuCbshViewController" bundle:nil];
        self.iSMViewController=[[HaishijuISMViewController alloc] initWithNibName:@"HaishijuISMViewController" bundle:nil];
        self.hccyViewController=[[HaishijuHccyViewController alloc] initWithNibName:@"HaishijuHccyViewController" bundle:nil];
         self.nSMViewController=[[HaishijuNSMViewController alloc] initWithNibName:@"HaishijuNSMViewController" bundle:nil];
        self.zdgzViewController=[[HaishijuZdgzViewController alloc] initWithNibName:@"HaishijuZdgzViewController" bundle:nil];
        self.nhcyViewController=[[HaishijuNhcyViewController alloc] initWithNibName:@"HaishijuNhcyViewController" bundle:nil];
                self.zfzcxViewController=[[HaishijuZfzcxViewController alloc] initWithNibName:@"HaishijuZfzcxViewController" bundle:nil];
        
    }
    self.navigationController.navigationBarHidden=YES;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     UIFont *font = [UIFont fontWithName:@"Arial" size:12];
//    if (indexPath.row!=4)
//    {
        int row=indexPath.row*3;
        UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame=CGRectMake(40, 20, 61, 57);
        button1.tag=row;
        [button1 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];
        [button1 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row] ] forState:UIControlStateNormal];
        [cell addSubview:button1];
        UILabel *label1=[[UILabel alloc] initWithFrame:CGRectMake(40, 80, 60, 40)];
        label1.backgroundColor=[UIColor clearColor];
        [label1 setFont:font];
        [label1 setNumberOfLines:0];
        label1.text=[modelArray objectAtIndex:row];
        [cell addSubview:label1];
        
        UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame=CGRectMake(130, 20, 61, 57);
        button2.tag=row+1;
        [button2 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];

        [button2 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+1] ] forState:UIControlStateNormal];
        [cell addSubview:button2];
        UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(130, 80, 60, 40)];
        label2.backgroundColor=[UIColor clearColor];
        [label2 setFont:font];
        label2.text=[modelArray objectAtIndex:row+1];
        [label2 setNumberOfLines:0];
        [cell addSubview:label2];
        
        UIButton *button3=[UIButton buttonWithType:UIButtonTypeCustom];
        button3.frame=CGRectMake(220, 20, 61, 57);
        button3.tag=row+2;
        [button3 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];

        [button3 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+2] ] forState:UIControlStateNormal];
        [cell addSubview:button3];
        UILabel *label3=[[UILabel alloc] initWithFrame:CGRectMake(220, 80, 60, 40)];
        label3.backgroundColor=[UIColor clearColor];
        [label3 setFont:font];
        label3.text=[modelArray objectAtIndex:row+2];
        [label3 setNumberOfLines:0];
        [cell addSubview:label3];
        
//    }else
//    {
//        int row=indexPath.row*3;
//        UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
//        button1.frame=CGRectMake(40, 20, 61, 57);
//        button1.tag=row;
//        [button1 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];
//        [button1 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row] ] forState:UIControlStateNormal];
//        [cell addSubview:button1];
//        UILabel *label1=[[UILabel alloc] initWithFrame:CGRectMake(40, 80, 60, 40)];
//        label1.backgroundColor=[UIColor clearColor];
//        [label1 setFont:font];
//        [label1 setNumberOfLines:0];
//        label1.text=[modelArray objectAtIndex:row];
//        [cell addSubview:label1];
//        
//        UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
//        button2.frame=CGRectMake(130, 20, 61, 57);
//        button2.tag=row+1;
//        [button2 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];
//        [button2 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+1] ] forState:UIControlStateNormal];
//        [cell addSubview:button2];
//        UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(130, 80, 60, 40)];
//        label2.backgroundColor=[UIColor clearColor];
//        [label2 setFont:font];
//        label2.text=[modelArray objectAtIndex:row+1];
//        [label2 setNumberOfLines:0];
//        [cell addSubview:label2];
//    }
    
    return cell;
    
    
}
-(void)pushToChildViewController:(id)sender
{
    NSLog(@"%d",[sender tag]);
    switch ([sender tag]) {
        case 0:
        {
            [self.navigationController pushViewController:self.zfxxViewController animated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:self.cxcbViewController animated:YES];
        }
            break;
        case 2:
        {
             [self.navigationController pushViewController:self.gzcbViewController animated:YES];
        }
            break;
        case 3:
        {
            
          UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"错误" message:@"JSON格式不规范" delegate:nil cancelButtonTitle:@"等待处理" otherButtonTitles: nil];
            [alertView show];
            //[self.navigationController pushViewController:self.xccbViewController animated:YES];
        }
            break;
        case 4:
        {
            [self.navigationController pushViewController:self.cbshViewController animated:YES];
        }
            break;
        case 5:
        {
            [self.navigationController pushViewController:self.iSMViewController animated:YES];
      
        }
            break;
        case 6:
        {
            [self.navigationController pushViewController:self.hccyViewController animated:YES];

        }
            break;
        case 7:
        {
            [self.navigationController pushViewController:self.nSMViewController animated:YES];
        }
            break;
        case 8:
        {
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"错误" message:@"JSON格式不规范" delegate:nil cancelButtonTitle:@"等待处理" otherButtonTitles: nil];
            [alertView show];
          //  [self.navigationController pushViewController:self.zdgzViewController animated:YES];
        }
            break;
        case 9:
        {
            [self.navigationController pushViewController:self.nhcyViewController animated:YES ];
        }
            break;
        case 10:
        {
            [self.navigationController pushViewController:self.zfzcxViewController animated:YES ];

        }
            break;
        case 11:
        {
            
        }
            break;
        case 12:
        {
            
        }
            break;
        case 13:
        {
            
        }
            break;
        case 14:
        {
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
