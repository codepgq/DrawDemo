//
//  SectionModel.h
//  刘振tableviewdemo
//
//  Created by ios on 16/8/11.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

@property (nonatomic,copy) NSString * section;
@property (nonatomic,strong) NSArray * items;


+ (instancetype)sectionWithDict:(NSDictionary *)dict;

@end
