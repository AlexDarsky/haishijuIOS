//
//  HaishijuRequisitionFirstViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-17.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuRequisitionChildViewController.h"

@interface HaishijuRequisitionChildViewController ()

@end

@implementation HaishijuRequisitionChildViewController
@synthesize customNavBar;
@synthesize detailDescription,detailUse,mailBtn,emailBtn,chuanZhenBtn,ziquBtn,beiZhuField,firstInfo;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([[UIScreen mainScreen] bounds].size.height>480.00)
        {
            self=[super initWithNibName:@"HaishijuRequisitionChildViewController_4" bundle:nil];
        }
        else
        {
            self=[super initWithNibName:@"HaishijuRequisitionChildViewController" bundle:nil];
        }

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
    userType=0;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textFiledReturnEditing:)];
    [self.view addGestureRecognizer:tap];
    self.mailBtn.selected=self.emailBtn.selected=self.chuanZhenBtn.selected=self.ziquBtn.selected=NO;

}
- (IBAction)Submit:(id)sender
{
    if ([self.detailDescription.text isEqualToString:@""]||[self.detailUse.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"错误" message:@"请填写完您的信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alert show];
    }else
    {
        self.firstInfo=[self.firstInfo stringByAppendingFormat:@"所需信息描述：%@;所需信息用途：%@. 获取信息的方式：",self.detailDescription.text,self.detailUse.text];
        if (self.mailBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"邮寄；"];
        }
        if (self.emailBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"电子邮件；"];
        }
        if (self.chuanZhenBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"传真；"];
        }
        if (self.ziquBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"自行领取."];
        }
        self.firstInfo=[self.firstInfo stringByAppendingFormat:@"备注：%@",self.beiZhuField.text];
        NSLog(@"%@",self.firstInfo);
        NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/apply.asp"];
        
        //将NSSrring格式的参数转换格式为NSData，POST提交必须用NSData数据。
        NSData *postData = [self.firstInfo dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        //计算POST提交数据的长度
        NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
        NSLog(@"postLength=%@",postLength);
        //定义NSMutableURLRequest
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        //设置提交目的url
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:postData];
        
        //定义
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        //同步提交:POST提交并等待返回值（同步），返回值是NSData类型。
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        //将NSData类型的返回值转换成NSString类型
        NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"result is %@",result);
        if ([@"success" compare:result]==NSOrderedSame) {
            NSLog(@"YES");
        }else
            NSLog(@"NO");
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
    [self.detailDescription resignFirstResponder];
     [self.detailUse resignFirstResponder];
}
-(IBAction)exitKeyBoard:(id)sender
{
    [sender resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectedButton:(id)sender
{
    UIButton *button=(UIButton*)sender;
    if (button.selected==YES) {
       button.selected=NO;
        NSLog(@"BO");
    }else
    {
        button.selected=YES;
        NSLog(@"YES");
    }
   
}

- (void)viewDidUnload {
    [self setDetailDescription:nil];
    [self setDetailUse:nil];
    [self setMailBtn:nil];
    [self setEmailBtn:nil];
    [self setChuanZhenBtn:nil];
    [self setZiquBtn:nil];
    [self setBeiZhuField:nil];
    [super viewDidUnload];
}
@end
