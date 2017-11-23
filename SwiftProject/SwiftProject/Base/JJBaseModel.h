//
//  JJBaseModel.h
//  SwiftProject
//
//  Created by 刘毅 on 2017/11/23.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface JJBaseModel : MTLModel<MTLJSONSerializing>
#pragma mark - Json To Model
/**
 *  通过数据获取 模型或者模型数组
 */
+ (id)changeResponseJSONObject:(id)obj;

/**
 *  通过数据获取模型数组
 */
+ (NSArray *)changeJSONArray:(NSArray *)ary;
@end
