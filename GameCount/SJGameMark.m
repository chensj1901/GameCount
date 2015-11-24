//
//  SJGameMark.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJGameMark.h"

@implementation SJGameMark
-(id)initWithName:(NSString*)name teamTwoName:(NSString *)teamTwoName teamOneMark:(NSInteger)teamOneMark teamTwoMark:(NSInteger)teamTwoMark date:(NSTimeInterval)date{
    self=[self init];
    if (self) {
        _teamOneName = name;
        _teamOneMark = teamOneMark;
        _teamTwoName = teamTwoName;
        _teamTwoMark = teamTwoMark;
        _gateDate = date;
    }
    return self;
}


-(id)initWithDictionary:(NSDictionary *)dictionary{
    self=[self init];
    if (self) {
        __id = [[dictionary objectForKey:@"_id"]integerValue];
        _teamOneName = [dictionary objectForKey:@"teamOneName"];
        _teamOneMark = [[dictionary objectForKey:@"teamOneMark"]integerValue];
        _teamTwoName = [dictionary objectForKey:@"teamTwoName"];
        _teamTwoMark = [[dictionary objectForKey:@"teamTwoMark"]integerValue];
        _gateDate = [[dictionary objectForKey:@"gateDate"]integerValue];
    }
    return self;
}
@end
