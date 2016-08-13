//
//  PQTBDataSource.h
//  PQSeparationCode
//
//  Created by codepgq on 16/8/6.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface PQTBDataSource : NSObject <UITableViewDataSource>
//传入之后不允许用户在外面随意更改数据
@property (nonatomic,strong,readonly) NSMutableArray * _Nullable valuesArray;

+ (nonnull instancetype)dataSourceWith:(nullable NSArray *)values identifier:(nullable NSString *)identifier cellConfigBlock:(nullable void(^)( id _Nullable cell,id _Nullable item))block;
- (nonnull instancetype)initWithDataSource:(nullable NSArray *)values identifier:(nullable NSString *)identifier  cellConfigBlock:(nullable void(^)(id _Nullable cell,id _Nullable item))block;

//提供方法更新，删除,获取
- (void)pq_insertValueWithItem:(NSInteger)item value:(id _Nullable)value;
- (void)pq_deleteValueWithItem:(NSInteger)item;
- (id _Nullable)pq_valueWithItem:(NSInteger)item;
- (void)pq_updateWithArray:(nullable NSArray *)array;

@end
