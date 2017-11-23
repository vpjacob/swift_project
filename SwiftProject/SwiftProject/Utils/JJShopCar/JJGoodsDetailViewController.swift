//
//  JJGoodsDetailViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/19.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJGoodsDetailViewController: JJBaseViewController {

    let cycleImgs = [
    "ss","ss","ss"
    ]
    
    
    
    func initData() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.view.addSubview(self.jjTabelView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
