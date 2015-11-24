//
//  SJGameMark.h
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJGameMark : NSObject

/**
 *	@brief
 */
@property(nonatomic,readonly)NSInteger _id;
/**
 *	@brief
 */
@property(nonatomic,readonly)NSString *teamOneName;

/**
 *	@brief
 */
@property(nonatomic,readonly)NSInteger teamOneMark;

/**
 *	@brief
 */
@property(nonatomic,readonly)NSString *teamTwoName;

/**
 *	@brief
 */
@property(nonatomic,readonly)NSInteger teamTwoMark;

/**
 *	@brief
 */
@property(nonatomic,readonly)NSTimeInterval gateDate;

-(id)initWithName:(NSString*)name teamTwoName:(NSString *)teamTwoName teamOneMark:(NSInteger)teamOneMark teamTwoMark:(NSInteger)teamTwoMark date:(NSTimeInterval)date;
-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
