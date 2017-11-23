//
//  JJBaseModel.m
//  SwiftProject
//
//  Created by 刘毅 on 2017/11/23.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import "JJBaseModel.h"

@implementation JJBaseModel
#pragma mark - change to model
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return [NSDictionary mtl_identityPropertyMapWithModel:self.class];
}

+ (id)changeResponseJSONObject:(nullable id)obj {
    if ([obj isKindOfClass:[NSNull class]]) {
        NSLog(@"obj is nil");
        return nil;
    }
    if ([obj isKindOfClass:[NSArray class]]) {
        return [self changeJSONArray:obj];
    }
    NSError *error = nil;
    id model = [MTLJSONAdapter modelOfClass:self.class fromJSONDictionary:obj error:&error];
    if (error) {
        NSLog(@"changeResponseEroor:%@",error);
    }
    return model;
}

+ (NSArray *)changeJSONArray:(NSArray *)ary {
    if ([ary isKindOfClass:[NSNull class]]) {
        NSLog(@"array is nil");
        return nil;
    }
    NSError *error = nil;
    NSArray *models = [MTLJSONAdapter modelsOfClass:self.class fromJSONArray:ary error:&error];
    if (error) {
        NSLog(@"changeJSONArray:%@",error);
    }
    return models;
}


@end
