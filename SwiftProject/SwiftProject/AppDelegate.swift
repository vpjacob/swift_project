//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let url = URL(string: "http://xk.ppke.cn:9030/xk/appStartImg.do")
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.backgroundColor = UIColor.white
        let tabVC = JJTabBarViewController()
//        let nav = JJNavController(rootViewController: tabVC)
        window?.rootViewController = tabVC
        
        showAdvertisment()
        
        
        return true
    }

    func showAdvertisment() {
        let defaultImage = UIImage(named: "ad_image.png")
        SplashView.showSplashView(defaultImage: defaultImage, tapSplashImageBlock: { (tapString) in
            
        }) { (dissMiss) in
            
        }
        let headers: HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ]
        
        Alamofire.request(url!, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).response { (response) in
            let string = String(data: response.data!, encoding: .utf8)
            print(string!)
    
        }
        
        

//        Alamofire.request("https://httpbin.org/get").response { response in
//            print("Request: \(String(describing: response.request))")
//            print("Response: \(response.response)")
//            print("Error: \(response.error)")
//            response.error
//            response.response
//            response.data
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
//            }
//        }

        
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


}

