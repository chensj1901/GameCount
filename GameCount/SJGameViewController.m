//
//  SJGameViewController.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJGameViewController.h"
#import "SJGameView.h"
#import "SJGameMarkRecode.h"
#import "SJGameMark.h"
#import "SJAdsController.h"

@interface SJGameViewController ()<UIAlertViewDelegate>
@property(nonatomic)SJGameView *mainView;
@property(nonatomic)NSTimer *timer;
@property(nonatomic)NSInteger timeCount;
@end

@implementation SJGameViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        IOS7_LAYOUT();
        self.timeCount=0;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mainView.leftAddMarkBtn addTarget:self action:@selector(addLeftMark) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.leftReductMarkBtn addTarget:self action:@selector(reductLeftMark) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.mainView.startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.clearBtn addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.finishBtn addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.mainView.rightAddMarkBtn addTarget:self action:@selector(addRightMark) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.rightReductMarkBtn addTarget:self action:@selector(reductRightMark) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addLeftMark{
    NSInteger mark=[self.mainView.leftMarkLabel.text integerValue];
    self.mainView.leftMarkLabel.text=[NSString stringWithFormat:@"%ld",(long)mark+1];
}

-(void)reductLeftMark{
    NSInteger mark=[self.mainView.leftMarkLabel.text integerValue];
    if(mark>0){
        self.mainView.leftMarkLabel.text=[NSString stringWithFormat:@"%ld",(long)mark-1];
    }
}

-(void)addRightMark{
    NSInteger mark=[self.mainView.rightMarkLabel.text integerValue];
    self.mainView.rightMarkLabel.text=[NSString stringWithFormat:@"%ld",(long)mark+1];
}

-(void)reductRightMark{
    NSInteger mark=[self.mainView.rightMarkLabel.text integerValue];
    if(mark>0){
    self.mainView.rightMarkLabel.text=[NSString stringWithFormat:@"%ld",(long)mark-1];
    }
}

-(void)countTime{

    NSInteger second=self.timeCount%60;
    NSInteger minute=self.timeCount/60;
    
    NSString *timeStr=[NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    self.mainView.timeLabel.text=timeStr;
    
    self.timeCount++;
}

-(void)start{
    BOOL selected=self.mainView.startBtn.selected;
    
    if (selected) {
        [self.timer invalidate];
        self.timer=nil;
    }else{
        self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
    }
    
    self.mainView.startBtn.selected=!selected;
}

-(void)clear{
    self.mainView.leftMarkLabel.text=@"0";
    self.mainView.rightMarkLabel.text=@"0";
    self.mainView.timeLabel.text=@"00:00";
    self.timeCount=0;
    
    [self.timer invalidate];
    self.timer=nil;
    self.mainView.startBtn.selected=NO;
}

-(void)finish{
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:NSLocalizedString(@"Tips", nil) message:NSLocalizedString(@"Do you want to save the result", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:NSLocalizedString(@"Save", nil),NSLocalizedString(@"Back without Save", nil), nil];
        [alertView show];
        

        [MobClick event:@"01-02"];
}

-(void)alertViewCancel:(UIAlertView *)alertView{

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:NSLocalizedString(@"Save", nil)]) {
        SJGameMark *gameMark=[[SJGameMark alloc]initWithName:self.mainView.leftTeamNameTextField.text teamTwoName:self.mainView.rightTeamNameTextField.text teamOneMark:[self.mainView.leftMarkLabel.text integerValue] teamTwoMark:[self.mainView.rightMarkLabel.text integerValue] date:[[NSDate date]timeIntervalSince1970]];
        [SJGameMarkRecode insertGameMark:gameMark];
        
        [self.navigationController popViewControllerAnimated:YES];
    }else if ([buttonTitle isEqualToString:NSLocalizedString(@"Back without Save", nil)]){

        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.timer invalidate];
    self.timer=nil;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [MobClick beginLogPageView:@"记分页"];
    [SJAdsController showAdsBanner];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [MobClick endLogPageView:@"记分页"];
    [SJAdsController removeAdsBanner];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView{
    self.view=self.mainView;
}

-(SJGameView *)mainView{
    if (!_mainView) {
        _mainView=[[SJGameView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    }
    return _mainView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
