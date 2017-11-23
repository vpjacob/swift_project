//
//  JJqqqqViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import GoogleMobileAds

class JJqqqqViewController: JJBaseViewController {
    
    var adInterstitial = GADInterstitial(adUnitID: "ca-app-pub-9554187975714748/4439146610")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // self.navigationController?.navigationBar.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let gadRequest1 = GADRequest()
        self.adInterstitial.load(gadRequest1)
        
        let btn1 = UIButton(type: .contactAdd)
        btn1.center = self.view.center
        self.view.addSubview(btn1)
        btn1.addTarget(self, action: #selector(btnAction), for: UIControlEvents.touchUpInside)
        
    }
    
    func btnAction() {
        if self.adInterstitial.isReady {
            self.adInterstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
