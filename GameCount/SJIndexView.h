//
//  SJIndexView.h
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJIndexView : UIView
@property(nonatomic,readonly)UIImageView *backgroundImageView;
@property(nonatomic,readonly)UIImageView *titleImageView;
@property(nonatomic,readonly)UIButton *startBtn;
@property(nonatomic,readonly)UIButton *historyBtn;
@property(nonatomic,readonly)UIButton *appRecommendBtn;

-(void)setAdsOn:(BOOL)on;
@end
