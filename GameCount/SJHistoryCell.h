//
//  SJHistoryCell.h
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJCell.h"
#import "SJGameMark.h"

@interface SJHistoryCell : SJCell
@property(nonatomic,readonly)UILabel *dateLabel;
@property(nonatomic,readonly)UILabel *teamLabel;
@property(nonatomic,readonly)UILabel *markLabel;
@property(nonatomic,readonly)UIView *lineView;
+(CGFloat)cellHeight;
-(void)loadGameMark:(SJGameMark*)gameMark;
@end
