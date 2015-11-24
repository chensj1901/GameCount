//
//  SJHistoryCell.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJHistoryCell.h"

@implementation SJHistoryCell
{
    CGRect _dateLabelRect;
    CGRect _teamLabelRect;
    CGRect _markLabelRect;
    CGRect _lineViewRect;
}


@synthesize dateLabel=_dateLabel;
@synthesize teamLabel=_teamLabel;
@synthesize markLabel=_markLabel;
@synthesize lineView=_lineView;


#pragma mark - 初始化

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSetting];
        [self loadUI];
    }
    return self;
}

-(void)loadSetting{
    CGFloat width=WIDTH/3.;
    _dateLabelRect= CGRectMake(0, 0, width, 50);
    _teamLabelRect= CGRectMake(width, 0, width, 50);
    _markLabelRect= CGRectMake(width*2, 0, width, 50);
    _lineViewRect= CGRectMake(0, 49, WIDTH, 1);
}

-(void)loadUI{
    [self addSubview:self.dateLabel];
    [self addSubview:self.teamLabel];
    [self addSubview:self.markLabel];
    [self addSubview:self.lineView];
}

#pragma mark - 属性定义

-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel=[[UILabel alloc]initWithFrame:_dateLabelRect];
        [_dateLabel quicklySetFontPoint:12 textColorHex:@"ffffff" textAlignment:NSTextAlignmentCenter];
    }
    return _dateLabel;
}

-(UILabel *)teamLabel{
    if (!_teamLabel) {
        _teamLabel=[[UILabel alloc]initWithFrame:_teamLabelRect];
        [_teamLabel quicklySetFontPoint:12 textColorHex:@"ffffff" textAlignment:NSTextAlignmentCenter];
    }
    return _teamLabel;
}

-(UILabel *)markLabel{
    if (!_markLabel) {
        _markLabel=[[UILabel alloc]initWithFrame:_markLabelRect];
        [_markLabel quicklySetFontPoint:12 textColorHex:@"ffffff" textAlignment:NSTextAlignmentCenter];
    }
    return _markLabel;
}



-(UIView *)lineView{
    if (!_lineView) {
        _lineView=[[UIView alloc]initWithFrame:_lineViewRect];
        _lineView.backgroundColor=[UIColor whiteColor];
    }
    return _lineView;
}

#pragma mark - 其他方法

+(CGFloat)cellHeight{
    return 50;
}

-(void)loadGameMark:(SJGameMark *)gameMark{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    self.dateLabel.text=
    [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:gameMark.gateDate]];
    self.teamLabel.text=[NSString stringWithFormat:@"%@  VS  %@",gameMark.teamOneName,gameMark.teamTwoName];
    self.markLabel.text=[NSString stringWithFormat:@"%ld - %ld",(long)gameMark.teamOneMark,(long)gameMark.teamTwoMark];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
