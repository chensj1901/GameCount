//
//  SJHistoryView.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJHistoryView.h"

@implementation SJHistoryView
{
    CGRect _backgroundImageViewRect;
    CGRect _detailTableViewRect;
    CGRect _backBtnRect;
}


@synthesize backgroundImageView=_backgroundImageView;
@synthesize detailTableView=_detailTableView;
@synthesize backBtn=_backBtn;


#pragma mark - 初始化

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self loadSetting];
        [self loadUI];
    }
    return self;
}

-(void)loadSetting{
    _backgroundImageViewRect= CGRectMake(0, 0, WIDTH, HEIGHT);
    _detailTableViewRect= CGRectMake(0, 0, WIDTH, HEIGHT-123);
    _backBtnRect= CGRectMake((WIDTH-53)/2, HEIGHT-113, 53, 53);
}

-(void)loadUI{
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.detailTableView];
    [self addSubview:self.backBtn];
}

#pragma mark - 属性定义

-(UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView=[[UIImageView alloc]initWithFrame:_backgroundImageViewRect];
        _backgroundImageView.contentMode=UIViewContentModeScaleAspectFill;
        _backgroundImageView.image=[UIImage imageNamed:@"backgroundImage.jpg"];
    }
    return _backgroundImageView;
}

-(UITableView *)detailTableView{
    if (!_detailTableView) {
        _detailTableView=[[UITableView alloc]initWithFrame:_detailTableViewRect];
        _detailTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _detailTableView.backgroundColor=[UIColor clearColor];
    }
    return _detailTableView;
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame=_backBtnRect;
        [_backBtn quicklySetNormalImageNamed:@"recode_finishBtn.png" highlightImageNamed:nil selectedImageNamed:nil];
    }
    return _backBtn;
}



#pragma mark - 其他方法
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
