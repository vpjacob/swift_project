//
//  JJTabBarViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJTabBarViewController: UITabBarController {

    public var HomeVC:JJHomeViewController?
    public var GuanjiaVC:JJGuanjiaViewController?
    public var ShangJiaVC:JJShangJiaViewController?
    public var ShopVC:JJShopViewController?
    public var MeVC:JJMeViewController?
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeVC = JJHomeViewController()
        GuanjiaVC = JJGuanjiaViewController()
        ShangJiaVC = JJShangJiaViewController()
        ShopVC = JJShopViewController()
        MeVC = JJMeViewController()
        
        initViewControllers(VC: GuanjiaVC!, title: "管家", iconString: "guanjia")
        initViewControllers(VC: ShangJiaVC!, title: "商家", iconString: "shangjia")
        initViewControllers(VC: HomeVC!, title: "", iconString: "home")
        initViewControllers(VC: ShopVC!, title: "商城", iconString: "shop")
        initViewControllers(VC: MeVC!, title: "我的", iconString: "me")
        
        self.viewControllers = [GuanjiaVC!,ShangJiaVC!,HomeVC!,ShopVC!,MeVC!]
        
    }
    

    func initViewControllers(VC:JJBaseViewController,title:String,iconString:String) {
        VC.tabBarItem.image = UIImage(named: iconString)
        VC.tabBarItem.selectedImage = UIImage(named: iconString + "selected")
        VC.tabBarItem.title = title
//        self.navigationItem.titleView = VC.navigationItem.titleView;
    }
    


}
