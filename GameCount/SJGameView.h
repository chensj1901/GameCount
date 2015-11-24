//
//  SJGameView.h
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJGameView : UIView
@property(nonatomic,readonly)UIImageView *backgroundImageView;
@property(nonatomic,readonly)UITextField *leftTeamNameTextField;
@property(nonatomic,readonly)UILabel *leftMarkLabel;
@property(nonatomic,readonly)UIButton *leftAddMarkBtn;
@property(nonatomic,readonly)UIButton *leftReductMarkBtn;
@property(nonatomic,readonly)UIImageView *vsImageView;
@property(nonatomic,readonly)UILabel *timeTitleLabel;
@property(nonatomic,readonly)UILabel *timeLabel;
@property(nonatomic,readonly)UIButton *startBtn;
@property(nonatomic,readonly)UIButton *clearBtn;
@property(nonatomic,readonly)UIButton *finishBtn;
@property(nonatomic,readonly)UITextField *rightTeamNameTextField;
@property(nonatomic,readonly)UILabel *rightMarkLabel;
@property(nonatomic,readonly)UIButton *rightAddMarkBtn;
@property(nonatomic,readonly)UIButton *rightReductMarkBtn;
@end
