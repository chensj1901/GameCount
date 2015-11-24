//
//  SJIndexView.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJIndexView.h"
@implementation SJIndexView
{
    CGRect _backgroundImageViewRect;
    CGRect _titleImageViewRect;
    CGRect _startBtnRect;
    CGRect _historyBtnRect;
    CGRect _appRecommendBtnRect;
}


@synthesize backgroundImageView=_backgroundImageView;
@synthesize titleImageView=_titleImageView;
@synthesize startBtn=_startBtn;
@synthesize historyBtn=_historyBtn;
@synthesize appRecommendBtn=_appRecommendBtn;


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
    _titleImageViewRect= CGRectMake((WIDTH-245)/2, 80, 245, 45);
    _historyBtnRect= CGRectMake((WIDTH-78*3-200)/2, HEIGHT-128, 78, 78);
    _startBtnRect= CGRectMake((WIDTH-78*3-200)/2+178, HEIGHT-128, 78, 78);
    _appRecommendBtnRect= CGRectMake((WIDTH-78*3-200)/2+356, HEIGHT-128, 78, 78);
}

-(void)loadUI{
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.titleImageView];
    [self addSubview:self.startBtn];
    [self addSubview:self.historyBtn];
    [self addSubview:self.appRecommendBtn];
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

-(UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView=[[UIImageView alloc]initWithFrame:_titleImageViewRect];
        _titleImageView.image=[UIImage imageNamed:NSLocalizedString(@"titleImage_e.png", nil)];
    }
    return _titleImageView;
}

-(UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.frame=_startBtnRect;
        [_startBtn quicklySetNormalImageNamed:NSLocalizedString(@"index_startTitle_e.png", nil) highlightImageNamed:nil selectedImageNamed:nil];
        [_startBtn quicklySetNormalBackgroundImageNamed:@"index_startBtn.png" highlightBackgroundImageNamed:nil selectedBackgroundImageNamed:nil];
    }
    return _startBtn;
}

-(UIButton *)historyBtn{
    if (!_historyBtn) {
        _historyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _historyBtn.frame=_historyBtnRect;
        [_historyBtn quicklySetNormalImageNamed:NSLocalizedString(@"index_historyTitle_e.png", nil) highlightImageNamed:nil selectedImageNamed:nil];
        [_historyBtn quicklySetNormalBackgroundImageNamed:@"index_historyBtn.png" highlightBackgroundImageNamed:nil selectedBackgroundImageNamed:nil];
    }
    return _historyBtn;
}


-(UIButton *)appRecommendBtn{
    if (!_appRecommendBtn) {
        _appRecommendBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _appRecommendBtn.frame=_appRecommendBtnRect;
        [_appRecommendBtn quicklySetNormalImageNamed:NSLocalizedString(@"index_appRecommendBtn_e.png", nil) highlightImageNamed:nil selectedImageNamed:nil];
        _appRecommendBtn.hidden=YES;
    }
    return _appRecommendBtn;
}



#pragma mark - 其他方法
-(void)setAdsOn:(BOOL)on{
    if (on) {
        self.appRecommendBtn.hidden=NO;
        
        [self.historyBtn quicklySetOriginX:(WIDTH-78*3-200)/2];
        [self.startBtn quicklySetOriginX:(WIDTH-78*3-200)/2+178];
        [self.appRecommendBtn quicklySetOriginX:(WIDTH-78*3-200)/2+356];
        
                                          
    }else{
        self.appRecommendBtn.hidden=YES;
        
        [self.historyBtn quicklySetOriginX:(WIDTH-78*2-100)/2];
        [self.startBtn quicklySetOriginX:(WIDTH-78*2-100)/2+178];
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
