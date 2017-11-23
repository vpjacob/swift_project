//
//  SwiftProject-Bridging-Header.h
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/16.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#ifndef SwiftProject_Bridging_Header_h
#define SwiftProject_Bridging_Header_h

#import <SMS_SDK/SMSSDK.h>
#import <Mantle/Mantle.h>

#import "JJBaseModel.h"

#import "JJHomeModel.h"








// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用idfa功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

#endif /* SwiftProject_Bridging_Header_h */
