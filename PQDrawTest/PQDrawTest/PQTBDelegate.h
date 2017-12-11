//
//  PQTBDelegate.h
//  刘振tableviewdemo
//
//  Created by ios on 16/8/11.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PQTBDelegate : NSObject<UITableViewDelegate>

//传入之后不允许用户在外面随意更改数据
@property (nonatomic,strong,readonly) NSMutableArray * _Nullable valuesArray;
@property (nonatomic,assign) CGFloat headerH;

+ (nonnull instancetype)delegateWith:(nullable NSArray *)values identifier:(nullable NSString *)identifier cellSelectedBlock:(nullable void(^)( id _Nullable cell,id _Nullable item))block;
- (nonnull instancetype)initWithdelegate:(nullable NSArray *)values identifier:(nullable NSString *)identifier cellSelectedBlock:(nullable void(^)(id _Nullable cell,id _Nullable item))block;
@end
