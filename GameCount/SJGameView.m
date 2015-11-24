//
//  SJGameView.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJGameView.h"

@implementation SJGameView
{
    CGRect _backgroundImageViewRect;
    CGRect _leftTeamNameTextFieldRect;
    CGRect _leftMarkLabelRect;
    CGRect _leftAddMarkBtnRect;
    CGRect _leftReductMarkBtnRect;
    CGRect _vsImageViewRect;
    CGRect _timeTitleLabelRect;
    CGRect _timeLabelRect;
    CGRect _startBtnRect;
    CGRect _clearBtnRect;
    CGRect _finishBtnRect;
    CGRect _rightTeamNameTextFieldRect;
    CGRect _rightMarkLabelRect;
    CGRect _rightAddMarkBtnRect;
    CGRect _rightReductMarkBtnRect;
}

@synthesize backgroundImageView=_backgroundImageView;
@synthesize leftTeamNameTextField=_leftTeamNameTextField;
@synthesize leftMarkLabel=_leftMarkLabel;
@synthesize leftAddMarkBtn=_leftAddMarkBtn;
@synthesize leftReductMarkBtn=_leftReductMarkBtn;
@synthesize vsImageView=_vsImageView;
@synthesize timeTitleLabel=_timeTitleLabel;
@synthesize timeLabel=_timeLabel;
@synthesize startBtn=_startBtn;
@synthesize clearBtn=_clearBtn;
@synthesize finishBtn=_finishBtn;
@synthesize rightTeamNameTextField=_rightTeamNameTextField;
@synthesize rightMarkLabel=_rightMarkLabel;
@synthesize rightAddMarkBtn=_rightAddMarkBtn;
@synthesize rightReductMarkBtn=_rightReductMarkBtn;


#pragma mark - 初始化

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self loadSetting];
        [self loadUI];
    }
    return self;
}

-(void)loadSetting{
    CGFloat midleWidth=100*WIDTH/480.;
    CGFloat sideWidth=(WIDTH-midleWidth-60)/2;
    CGFloat offsetY=30*HEIGHT/320.;
    CGFloat spaceHeight=10*HEIGHT/320.;
    
    _backgroundImageViewRect= CGRectMake(0, 0, WIDTH, HEIGHT);
    _leftTeamNameTextFieldRect= CGRectMake(30, offsetY, sideWidth, 30);
    _leftMarkLabelRect= CGRectMake(30, offsetY+30+spaceHeight, sideWidth, sideWidth);
    _leftAddMarkBtnRect= CGRectMake(30, sideWidth+offsetY+30+spaceHeight*2, 40, 40);
    _leftReductMarkBtnRect= CGRectMake(30+sideWidth-40, sideWidth+offsetY+30+spaceHeight*2, 40, 40);
    
    _vsImageViewRect= CGRectMake((WIDTH-41)/2, 104, 41, 21);
    _timeTitleLabelRect= CGRectMake(0, CGRectGetMaxY(_leftAddMarkBtnRect)+10, WIDTH/2, 20);
    _timeLabelRect= CGRectMake(WIDTH/2, CGRectGetMaxY(_leftAddMarkBtnRect)+10, WIDTH/2, 20);
    _startBtnRect= CGRectMake((WIDTH-58)/2, HEIGHT-offsetY-spaceHeight*3-58-23, 58, 58);
    _clearBtnRect= CGRectMake((WIDTH-65*2-10)/2, HEIGHT-offsetY-spaceHeight*2-23, 65, 23);
    _finishBtnRect= CGRectMake(CGRectGetMaxX(_clearBtnRect)+10, HEIGHT-offsetY-spaceHeight*2-23, 65, 23);
    
    CGFloat rightOffsetX=(WIDTH-midleWidth)/2+midleWidth;
    _rightTeamNameTextFieldRect= CGRectMake(rightOffsetX, offsetY, sideWidth, 30);
    _rightMarkLabelRect= CGRectMake(rightOffsetX, offsetY+30+spaceHeight, sideWidth, sideWidth);
    _rightAddMarkBtnRect= CGRectMake(rightOffsetX, sideWidth+offsetY+30+spaceHeight*2, 40, 40);
    _rightReductMarkBtnRect= CGRectMake(rightOffsetX+sideWidth-40, sideWidth+offsetY+30+spaceHeight*2, 40, 40);
}

-(void)loadUI{
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.leftTeamNameTextField];
    [self addSubview:self.leftMarkLabel];
    [self addSubview:self.leftAddMarkBtn];
    [self addSubview:self.leftReductMarkBtn];
    [self addSubview:self.vsImageView];
    [self addSubview:self.timeTitleLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.startBtn];
    [self addSubview:self.clearBtn];
    [self addSubview:self.finishBtn];
    [self addSubview:self.rightTeamNameTextField];
    [self addSubview:self.rightMarkLabel];
    [self addSubview:self.rightAddMarkBtn];
    [self addSubview:self.rightReductMarkBtn];
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

-(UITextField *)leftTeamNameTextField{
    if (!_leftTeamNameTextField) {
        _leftTeamNameTextField=[[UITextField alloc]initWithFrame:_leftTeamNameTextFieldRect];
        _leftTeamNameTextField.font=[UIFont systemFontOfSize:16];
        _leftTeamNameTextField.backgroundColor=[UIColor whiteColor];
        _leftTeamNameTextField.placeholder=NSLocalizedString(@"Team Name", nil);
    }
    return _leftTeamNameTextField;
}

-(UILabel *)leftMarkLabel{
    if (!_leftMarkLabel) {
        _leftMarkLabel=[[UILabel alloc]initWithFrame:_leftMarkLabelRect];
        [_leftMarkLabel quicklySetFontPoint:(WIDTH-160)/4 textColorHex:@"373146" textAlignment:NSTextAlignmentCenter text:@"0"];
        _leftMarkLabel.backgroundColor=[UIColor whiteColor];
    }
    return _leftMarkLabel;
}

-(UIButton *)leftAddMarkBtn{
    if (!_leftAddMarkBtn) {
        _leftAddMarkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _leftAddMarkBtn.frame=_leftAddMarkBtnRect;
        [_leftAddMarkBtn quicklySetNormalImageNamed:@"count_+Btn.png" highlightImageNamed:nil selectedImageNamed:nil];
    }
    return _leftAddMarkBtn;
}

-(UIButton *)leftReductMarkBtn{
    if (!_leftReductMarkBtn) {
        _leftReductMarkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _leftReductMarkBtn.frame=_leftReductMarkBtnRect;
        [_leftReductMarkBtn quicklySetNormalImageNamed:@"count_-Btn.png" highlightImageNamed:nil selectedImageNamed:nil];
    }
    return _leftReductMarkBtn;
}

-(UIImageView *)vsImageView{
    if (!_vsImageView) {
        _vsImageView=[[UIImageView alloc]initWithFrame:_vsImageViewRect];
        _vsImageView.image=[UIImage imageNamed:@"count_vs.png"];
    }
    return _vsImageView;
}

-(UILabel *)timeTitleLabel{
    if (!_timeTitleLabel) {
        _timeTitleLabel=[[UILabel alloc]initWithFrame:_timeTitleLabelRect];
        [_timeTitleLabel quicklySetFontPoint:18 textColorHex:@"ffffff" textAlignment:NSTextAlignmentCenter text:@"TIME"];
    }
    return _timeTitleLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel=[[UILabel alloc]initWithFrame:_timeLabelRect];
        [_timeLabel quicklySetFontPoint:18 textColorHex:@"ffffff" textAlignment:NSTextAlignmentCenter text:@"00:00"];
    }
    return _timeLabel;
}

-(UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.frame=_startBtnRect;
        [_startBtn quicklySetNormalImageNamed:@"count_startBtn.png" highlightImageNamed:nil selectedImageNamed:@"count_pauseBtn.png"];
    }
    return _startBtn;
}

-(UIButton *)clearBtn{
    if (!_clearBtn) {
        _clearBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _clearBtn.frame=_clearBtnRect;
        [_clearBtn quicklySetNormalImageNamed:@"count_clearBtn.png" highlightImageNamed:nil selectedImageNamed:nil];
    }
    return _clearBtn;
}

-(UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _finishBtn.frame=_finishBtnRect;
        [_finishBtn quicklySetNormalImageNamed:@"count_finishBtn.png" highlightImageNamed:nil selectedImageNamed:nil];
    }
    return _finishBtn;
}

-(UITextField *)rightTeamNameTextField{
    if (!_rightTeamNameTextField) {
        _rightTeamNameTextField=[[UITextField alloc]initWithFrame:_rightTeamNameTextFieldRect];
        _rightTeamNameTextField.backgroundColor=[UIColor whiteColor];
        _rightTeamNameTextField.font=[UIFont systemFontOfSize:16];
        _rightTeamNameTextField.placeholder=NSLocalizedString(@"Team Name", nil);
    }
    return _rightTeamNameTextField;
}

-(UILabel *)rightMarkLabel{
    if (!_rightMarkLabel) {
        _rightMarkLabel=[[UILabel alloc]initWithFrame:_rightMarkLabelRect];
        [_rightMarkLabel quicklySetFontPoint:(WIDTH-160)/4 textColorHex:@"373146" textAlignment:NSTextAlignmentCenter text:@"0"];
        _rightMarkLabel.backgroundColor=[UIColor whiteColor];
    }
    return _rightMarkLabel;
}

-(UIButton *)rightAddMarkBtn{
    if (!_rightAddMarkBtn) {
        _rightAddMarkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightAddMarkBtn.frame=_rightAddMarkBtnRect;
        [_rightAddMarkBtn quicklySetNormalImageNamed:@"count_+Btn.png" highlightImageNamed:nil selectedImageNamed:nil];
    }
    return _rightAddMarkBtn;
}

-(UIButton *)rightReductMarkBtn{
    if (!_rightReductMarkBtn) {
        _rightReductMarkBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightReductMarkBtn.frame=_rightReductMarkBtnRect;
        [_rightReductMarkBtn quicklySetNormalImageNamed:@"count_-Btn.png" highlightImageNamed:nil selectedImageNamed:nil];
    }
    return _rightReductMarkBtn;
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
