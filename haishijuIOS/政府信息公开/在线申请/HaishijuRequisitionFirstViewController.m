//
//  HaishijuRequisitionFirstViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-17.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuRequisitionFirstViewController.h"

@interface HaishijuRequisitionFirstViewController ()

@end

@implementation HaishijuRequisitionFirstViewController
@synthesize customNavBar,tableView;
@synthesize userAdress,userChuanzhen,userDanwei,userEmail,userName,userNumber,credNumber,credType,zipCode;
@synthesize orgAdress,orgCode,orgConChuanzhen,orgConName,orgConNumber,orgCorpo,orgEmail,orgName,applyDate;
@synthesize requisitionChildViewController;
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
    self.tableView.backgroundColor=[UIColor clearColor];
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"listViewBG"]];
    userType=0;
    self.requisitionChildViewController=[[HaishijuRequisitionChildViewController alloc] init];
    self.userName=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.userDanwei=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.credType=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.credNumber=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.userNumber=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.userChuanzhen=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.userEmail=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.zipCode=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.userAdress=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.applyDate=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgName=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgCode=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgCorpo=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgConName=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgConNumber=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgConChuanzhen=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgAdress=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    self.orgEmail=[[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];



}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int number;
    switch (userType) {
        case 0:
        {
            number=11;
        }
            break;
        case 1:
        {
            number=10;
        }
            break;
    }
    return number;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UIFont *font = [UIFont fontWithName:@"Arial" size:15];
    switch (userType) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    self.userName.placeholder=@" 请输入姓名";
                    self.userName.borderStyle = UITextBorderStyleRoundedRect;
                    self.userName.font=font;
                    [self.userName addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.userName];
                }
                    break;
                case 1:
                {
                    
                    self.userDanwei.placeholder=@" 请输入工作单位";
                    self.userDanwei.borderStyle = UITextBorderStyleRoundedRect;
                    self.userDanwei.font=font;
                    [self.userDanwei addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.userDanwei];
                }
                    break;
                case 2:
                {
                   
                    self.credType.placeholder=@" 请输入证件名称";
                    self.credType.borderStyle = UITextBorderStyleRoundedRect;
                    self.credType.font=font;
                    [self.credType addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.credType];
                }
                    break;
                case 3:
                {
                    
                    self.credNumber.placeholder=@" 请输入证件号码";
                    self.credNumber.borderStyle = UITextBorderStyleRoundedRect;
                    self.credNumber.font=font;
                    [self.credNumber addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.credNumber];
                }
                    break;
                case 4:
                {
                   
                    self.userNumber.placeholder=@" 请输入联系电话";
                    self.userNumber.borderStyle = UITextBorderStyleRoundedRect;
                    self.userNumber.font=font;
                    [self.userNumber addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.userNumber];
                }
                    break;
                case 5:
                {
                    
                    self.userChuanzhen.placeholder=@" 请输入传真";
                    self.userChuanzhen.borderStyle = UITextBorderStyleRoundedRect;
                    self.userChuanzhen.font=font;
                    [self.userChuanzhen addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.userChuanzhen];
                }
                    break;
                case 6:
                {
                                        self.userEmail.placeholder=@" 请输入电子邮箱";
                    self.userEmail.borderStyle = UITextBorderStyleRoundedRect;
                    self.userEmail.font=font;
                    [self.userEmail addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.userEmail];
                }
                    break;
                case 7:
                {
                                        self.zipCode.placeholder=@" 请输入邮政编码";
                    self.zipCode.borderStyle = UITextBorderStyleRoundedRect;
                    self.zipCode.font=font;
                    [self.zipCode addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.zipCode];
                }
                    break;
                case 8:
                {
                                        self.userAdress.placeholder=@" 请输入联系地址";
                    self.userAdress.borderStyle = UITextBorderStyleRoundedRect;
                    self.userAdress.font=font;
                    [self.userAdress addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.userAdress];
                }
                    break;
                case 9:
                {
                                        self.applyDate.placeholder=@" 请输入申请时间(如:2012年01月01日)";
                    self.applyDate.borderStyle = UITextBorderStyleRoundedRect;
                    self.applyDate.font=font;
                    [self.applyDate addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
                    [cell addSubview:self.applyDate];
                }
                    break;
                case 10:
                {
                    UIButton *submitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
                    submitBtn.frame=CGRectMake(40, 15, 240, 30);
                    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
                    [submitBtn addTarget:self action:@selector(submitFirstInfo:) forControlEvents:UIControlEventTouchUpInside];
                    [cell addSubview:submitBtn];
                }
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {

                    self.orgName.placeholder=@" 请输入名称";
                    self.orgName.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgName.font=font;
                    [self.orgName addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgName];
                }
                    break;
                case 1:
                {

                    self.orgCode.placeholder=@" 请输入组织机构代码";
                    self.orgCode.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgCode.font=font;
                    [self.orgCode addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgCode];
                }
                    break;
                case 2:
                {

                    self.orgCorpo.placeholder=@" 请输入法定代表人";
                    self.orgCorpo.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgCorpo.font=font;
                    [self.orgCorpo addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgCorpo];
                }
                    break;
                case 3:
                {

                    self.orgConName.placeholder=@" 请输入联系人姓名";
                    self.orgConName.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgConName.font=font;
                    [self.orgConName addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgConName];
                }
                    break;
                case 4:
                {

                    self.orgConNumber.placeholder=@" 请输入联系人电话";
                    self.orgConNumber.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgConNumber.font=font;
                    [self.orgConNumber addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgConNumber];
                }
                    break;
                case 5:
                {

                    self.orgConChuanzhen.placeholder=@" 请输入传真";
                    self.orgConChuanzhen.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgConChuanzhen.font=font;
                    [self.orgConChuanzhen addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgConChuanzhen];
                }
                    break;
                case 6:
                {

                    self.orgAdress.placeholder=@" 请输入联系地址";
                    self.orgAdress.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgAdress.font=font;
                    [self.orgAdress addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgAdress];
                }
                    break;
                case 7:
                {

                    self.orgEmail.placeholder=@" 请输入电子邮箱";
                    self.orgEmail.borderStyle = UITextBorderStyleRoundedRect;
                    self.orgEmail.font=font;
                    [self.orgEmail addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.orgEmail];
                }
                    break;
                case 8:
                {
                    self.applyDate.placeholder=@" 请输入申请时间(如:2012年01月01日)";
                    self.applyDate.borderStyle = UITextBorderStyleRoundedRect;
                    self.applyDate.font=font;
                    [self.applyDate addTarget:self action:@selector(textFiledReturnEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];

                    [cell addSubview:self.applyDate];
                }
                    break;
                case 9:
                {
                    UIButton *submitBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
                    submitBtn.frame=CGRectMake(40, 15, 240, 30);
                    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
                    [submitBtn addTarget:self action:@selector(submitFirstInfo:) forControlEvents:UIControlEventTouchUpInside];
                    [cell addSubview:submitBtn];
                }
                    break;
                    
            }
        }
            break;
    }
    return cell;
}
-(void)submitFirstInfo:(id)sender
{
    switch (userType) {
        case 0:
        {
            if ([self.userName.text isEqualToString:@""]||self.userName.text==nil||[self.userDanwei.text isEqualToString:@""]||self.userDanwei.text==nil||[self.credType.text isEqualToString:@""]||self.credType.text==nil||[self.credNumber.text isEqualToString:@""]||self.credNumber.text==nil||[self.userNumber.text isEqualToString:@""]||self.userNumber.text==nil||[self.userChuanzhen.text isEqualToString:@""]||self.userChuanzhen.text==nil||[self.userEmail.text isEqualToString:@""]||self.userEmail.text==nil||[self.zipCode.text isEqualToString:@""]||self.zipCode.text==nil||[self.userAdress.text isEqualToString:@""]||self.userAdress.text==nil||[self.applyDate.text isEqualToString:@""]||self.applyDate.text==nil)
            {
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"错误" message:@"请填写完您的信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
                [alert show];
            }else
            {
                NSString *firstInfo=[NSString stringWithFormat:@"radio1=GM&Field1=%@&Field2=%@&Field3=%@&Field4=%@&Field5=%@&Field6=%@&Field7=%@&Field8=%@&Field9=%@&Field18=%@",self.userName.text,self.userDanwei.text,self.credType.text,self.credNumber.text,self.userNumber.text,self.userChuanzhen.text,self.userEmail.text,self.zipCode.text,self.userAdress.text,self.applyDate.text];
                [self.navigationController pushViewController:self.requisitionChildViewController animated:YES];
                [self.requisitionChildViewController setFirstInfo:firstInfo];
                
            }
        }
            break;
        case 1:
        {
            if ([self.orgName.text isEqualToString:@""]||self.orgName.text==nil||[self.orgCode.text isEqualToString:@""]||self.orgCode.text==nil||[self.orgCorpo.text isEqualToString:@""]||self.orgCorpo.text==nil||[self.orgConName.text isEqualToString:@""]||self.orgConName.text==nil||[self.orgConNumber.text isEqualToString:@""]||self.orgConNumber.text==nil||[self.orgConChuanzhen.text isEqualToString:@""]||self.orgConChuanzhen.text==nil||[self.orgAdress.text isEqualToString:@""]||self.orgAdress.text==nil||[self.orgEmail.text isEqualToString:@""]||self.orgEmail.text==nil||[self.applyDate.text isEqualToString:@""]||self.applyDate.text==nil)
            {
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"错误" message:@"请填写完您的信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
                [alert show];
            }else
            {
                NSString *firstInfo=[NSString stringWithFormat:@"radio1=FR&Field10=%@&Field11=%@&Field12=%@&Field13=%@&Field14=%@&Field15=%@&Field16=%@&Field17=%@&Field18=%@ ；",self.orgName.text,self.orgCode.text,self.orgCorpo.text,self.orgConName.text,self.orgConNumber.text,self.orgConChuanzhen.text,self.orgAdress.text,self.orgEmail.text,self.applyDate.text];
                [self.navigationController pushViewController:self.requisitionChildViewController animated:YES];
                [self.requisitionChildViewController setFirstInfo:firstInfo];
                
            }
        }
            break;
    }
}
- (IBAction)backAction:(id)sender {
    int index=[[self.navigationController viewControllers]indexOfObject:self];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-1]animated:YES];
}
- (IBAction)backToHomeAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)textFiledReturnEditing:(id)sender {
    [sender resignFirstResponder];
}
-(IBAction)changeUserType:(UISegmentedControl *)Seg
{
 NSInteger Index = Seg.selectedSegmentIndex;
    NSLog(@"%d",Index);
    userType=Index;
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
