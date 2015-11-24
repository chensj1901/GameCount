//
//  SJGameMarkRecode.h
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "DataBaseIO.h"
#import "SJGameMark.h"

@interface SJGameMarkRecode : DataBaseIO

+(void)initDB;
+(void)insertGameMark:(SJGameMark*)obj;
+(NSArray *)getGameMarks;
+(void)deleteGameMark:(NSInteger)gameId;
@end
