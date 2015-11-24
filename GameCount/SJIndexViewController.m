//
//  ViewController.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJIndexViewController.h"
#import "SJIndexView.h"
#import "SJGameViewController.h"
#import "SJHistoryViewController.h"
#import "SJSettingRecode.h"

@interface SJIndexViewController ()
@property(nonatomic)SJIndexView *mainView;
@end

@implementation SJIndexViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        IOS7_LAYOUT();
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.mainView.startBtn addTarget:self action:@selector(showGmaeVC) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.historyBtn addTarget:self action:@selector(showHistoryVC) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.appRecommendBtn addTarget:self action:@selector(showAppRecommendVC) forControlEvents:UIControlEventTouchUpInside];
}


-(void)showGmaeVC{
    SJGameViewController *gameVC=[[SJGameViewController alloc]init];
    [self.navigationController pushViewController:gameVC animated:YES];
}

-(void)showHistoryVC{
    SJHistoryViewController *gameVC=[[SJHistoryViewController alloc]init];
    [self.navigationController pushViewController:gameVC animated:YES];
}

-(void)showAppRecommendVC{

}

-(void)loadView{
    self.view=self.mainView;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    [MobClick beginLogPageView:@"主页"];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [MobClick endLogPageView:@"主页"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(SJIndexView *)mainView{
    if (!_mainView) {
        _mainView=[[SJIndexView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        [_mainView setAdsOn:[[SJSettingRecode getSet:@"adsOn"]boolValue]];
    }
    return _mainView;
}

@end
