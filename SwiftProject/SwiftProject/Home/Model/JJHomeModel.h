//
//  JJHomeModel.h
//  SwiftProject
//
//  Created by 刘毅 on 2017/11/23.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import "JJBaseModel.h"

@class JJDatasetModel;
@class JJHomeRowModel;


@interface JJHomeModel : JJBaseModel

@property (nonatomic, strong) NSString *execStatus;
@property (nonatomic, strong) JJDatasetModel *formDataset;
@end

@interface JJDatasetModel : JJBaseModel

@property (nonatomic, strong) NSString *checked;
@property (nonatomic, strong) NSString *placeOneList;
@property (nonatomic, strong) NSString *placeOneName;
@property (nonatomic, strong) NSString *placeTwoList;
@property (nonatomic, strong) NSString *placeThreeName;
@property (nonatomic, strong) NSString *placeTwoName;
@property (nonatomic, strong) NSString *placeFourList;
@property (nonatomic, strong) NSString *weather;
@property (nonatomic, strong) NSString *placeThreeList;

@end

@interface JJHomeRowModel : JJBaseModel

@property (nonatomic, assign) NSInteger id_banner;
@property (nonatomic, assign) NSInteger place_type_id;
@property (nonatomic, assign) NSInteger place_no;
@property (nonatomic, assign) NSInteger skip_type;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSString *place_explain;
@property (nonatomic, strong) NSString *img_url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *skip_no;
@property (nonatomic, strong) NSString *skip_url;
@property (nonatomic, strong) NSString *update_time;

@end



