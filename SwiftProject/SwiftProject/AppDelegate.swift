//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC9aTXwWRFypV5GF1x3Q32dFUd7CXNFA1l2yPC4nM0YqAi93VwIXM0RAI3Yje6w7g4Zn0GbUulUljGsuTMP2AV+zj+zxsXRcVKnL59SMJaU6Kdjt/qMGQEElFOG6fRGVWOwnqxfQ3ahE/UVtt5zLfIG00aLOENfbeqoaN3FtWWQ5omHe09T1h2KwENP52bUNXW4Y5/dJPu8lbxJvRdS9udJ6ljtSVSLeonQaEQb/dkwfggIPUDxQTuRO8df/DNa/ijdK+E8n025cYpy4c/ypTbBnQHmNck2VSGp1lpQG63Mc3mMevhwySAOjsdImFy2pPbvsgzQS7xTaVxMBHsMLl5PAgMBAAECggEABWMgrZ1a6a/aZpPzhVDeGcGpLs6uAKB/wukkL5wGGVVuKjhJjdNV4c3qOuaOi2m57PCipRBOoqFC+G6sDR9PyLOFDE/zAGoAt9Ca73OCVOnpGOT6s1FivgaZ+ZRd5kI3e6aHsI3yqdIvfladLRl5cMhBkWQgRm6R5ghVhnIKWXyohO9dILtvyuNfuyb7+uW1Cr4pdj+Ii51zdWocUza2NgqGifhUg/EasZtzn7nJksaJ1fmFKNdMj+UhfeYmqnWV2h0dm6QxmOpif16+VKIaNeOVvg8XNWtA6VAM7SQrc2Mukopda3ZhahTWdcyd9NQUjVMP99RKQRHGSfZvM/l8wQKBgQD0JAs+AEiO5WZN/rsX3lbThlcKM2QeQ33VAHGNuGxesnv/R82MeRh7SKdbNz1VWm9zTUWcG9I5fitVFH1Y0/0K3g5VX3zlgf8pOw7bcSEihds50U3Okn0XdCxXiZcGZ+hZ1TfK7nwv8804HsgNZeZ4OS22TG7PPBcdeP32utbDWwKBgQDGnJY9Qv6nDDILfmWPhqsAn3r6I5LiiMAiOSXxQAeXUhxqm8AcFgGOtQ4zK2zVnOiXaBpfSmIuIja1/7vBLFN6VGhMCNXgX41g+iAuRiBBSCVEAqm6S5vXCq6lxUTY5UfVUPQTcDL/bE0Fdk0MGG4ZcECW8SZA9LU3uAH2QMRHHQKBgERHpGFFwQU+ATvFB1xokY39H3C56MFSDOo6goepUZ22e1ltIn6sC33HVw76xwuNDGiJ7vL3EPeFYucboObr+vREIGweFZc2oT9Nxhz3adX269YixIkGjTe3BQPCdluTSfd922nFAzSCEh4k9bxRiICNNUyr2b3Zx3k1somDvbbLAoGAHsNMRgrldKxf6AXY50U9oWgSXUI7UxlJYUOmy9pWEqsmOaEMPY1vClKi82wLfH7ETAdU5mOYF3s3LDODOmWKPI1sZjKMJifGtzmm2GQGRPZOx1z+OxvQ9Jrz+Ds48bt5x+G1HHmpfISi3XC4eGIkU45egsKxYShGFW5L53+ap0UCgYBt1fD8zcgyJXKeXO7rg2+Z8HDqcqYvf/IJFH1/i+wjEa26Lmb5VW9uC+w8mywkc85N2nZPOEsyRU1+VBVFWxBB85EZc9sLSeoudIEqQPkaZTYNF3TYCJPGzW27taql6IQ5SGfvZ2+I2WSIgpf4nGt4J+Yd9dX/t4m3SCACwXkD9g==


import UIKit
import Alamofire
import SwiftyJSON
import IQKeyboardManagerSwift
import CoreData
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,BMKGeneralDelegate,JPUSHRegisterDelegate {

    var window: UIWindow?
    let urlstr = URL(string: "http://xk.ppke.cn:9030/xk/appStartImg.do")
    let imgUrlFront:String = "http://www.ppke.cn"
    lazy var tabVC:JJTabBarViewController = JJTabBarViewController()
    
    //百度地图管理者
    var _mapManager: BMKMapManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.sharedManager().enable = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = tabVC
        newVersion()
        showAdvertisment()
        
        //百度地图
        _mapManager = BMKMapManager()
        // 如果要关注网络及授权验证事件，请设定generalDelegate参数
        let ret = _mapManager?.start("nnWXnciG5vbnPLqktxsYZw86087ri4MW", generalDelegate: self)
        if ret == false {
            NSLog("manager start failed!")
        }
        //推送
        let entity = JPUSHRegisterEntity()
        entity.types = Int(JPAuthorizationOptions.alert.rawValue) |  Int(JPAuthorizationOptions.sound.rawValue) |  Int(JPAuthorizationOptions.badge.rawValue)
        JPUSHService.register(forRemoteNotificationConfig: entity, delegate: self)
        JPUSHService.setup(withOption: launchOptions, appKey: "fea83caed3acc79d8e24e9a1", channel: "App Store", apsForProduction: false)
        
        
        
        GADMobileAds.configure(withApplicationID: "pub-9554187975714748")
        
        return true
    }


    // MARK: - 广告页
    func showAdvertisment() {
        let defaultImage = UIImage(named: "ad_image.png")
        SplashView.showSplashView(defaultImage: defaultImage, tapSplashImageBlock: { (tapString) in
            
        }) { (dissMiss) in
            
        }
                Alamofire.request(urlstr!, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { (response) in

            let json = JSON(data: response.data!)
            let imgUrl:String = json["data"][0]["imgUrl"].string ?? ""
            if imgUrl.isEmpty{
                return
            }
                    
            SplashView.updateSplashData(self.imgUrlFront + imgUrl, actUrl: nil)
        }
        
    }

    //是否是新版本，是新版本展示新特性
    func newVersion() {
        let version:String = UserDefaults.standard.value(forKey: "version") as? String ?? ""
        if !version.isEmpty  {//不是空
            if System_AppVersion() == version {//相等  不做
                
            }else{
                UserDefaults.standard.set(System_AppVersion(), forKey: "version")
                window?.addSubview(JJGuideView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height)))
            }
            
        }else{//是空
            UserDefaults.standard.set(System_AppVersion(), forKey: "version")
            window?.addSubview(JJGuideView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height)))
        }
    }
    
    //jpush
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        /// Required - 注册 DeviceToken
        JPUSHService.registerDeviceToken(deviceToken)
    }
    @available(iOS 10.0,*)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        let userInfo = notification.request.content.userInfo as! Dictionary < String,Any >
        if notification.request.trigger is UNPushNotificationTrigger {
            JPUSHService.handleRemoteNotification(userInfo)
        }
        completionHandler(Int(UNNotificationPresentationOptions.alert.rawValue))
    }
    
    @available(iOS 10.0,*)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        let userInfo = response.notification.request.content.userInfo as! Dictionary < String,Any >
        if response.notification.request.trigger is UNPushNotificationTrigger {
            JPUSHService.handleRemoteNotification(userInfo);
        }
        completionHandler();
//        print(userInfo.description)
        let aps = userInfo["aps"] as! Dictionary < String,Any >
        let vc = aps["category"] as? String ?? "nil"
        
        if vc == "ccc"{
            self.tabVC.selectedIndex = 0
        }
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        JPUSHService.handleRemoteNotification(userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
    }
    


    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }


}

