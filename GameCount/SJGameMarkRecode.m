//
//  SJGameMarkRecode.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJGameMarkRecode.h"

@implementation SJGameMarkRecode
+(void)initDB{
    if (![self hasInstall]) {
        NSString *sql=@"CREATE TABLE `GAME_MARK` (`_id` integer,`teamOneName` text,`teamOneMark` integer,`teamTwoName` text,`teamTwoMark` integer,`gateDate` integer , PRIMARY KEY(`_id`))";
        [self executeUpdate:sql];
    }
}


+(BOOL)hasInstall{
    NSString *sql=@"select count(*) from `GAME_MARK`";
    return [[self executeQuery:sql]count]>0;
}

+(void)insertGameMark:(SJGameMark *)obj{
    NSString *sql=[NSString stringWithFormat:@"replace into `GAME_MARK` (teamOneName,teamOneMark,teamTwoName,teamTwoMark,gateDate ) values ('%@',%ld,'%@',%ld,%f) ",obj.teamOneName,(long)obj.teamOneMark,obj.teamTwoName,(long)obj.teamTwoMark,obj.gateDate];
    [self executeUpdate:sql];
}


+(NSArray *)getGameMarks{
    NSString *sql=@"select * from `GAME_MARK` order by _id desc";
    NSArray *sqlResult=[self executeQuery:sql];
    return sqlResult;
}

+(void)deleteGameMark:(NSInteger)gameId{
    NSString *sql=[NSString stringWithFormat:@"delete from `GAME_MARK` where _id=%ld",(long)gameId];
    [self executeUpdate:sql];
}
@end
