//
//  JJShangjiaNav.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/11.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJShangjiaNav: UIView {

    var leftBtn:UIButton = {
       let btn = UIButton(type: UIButtonType.custom)
        
        btn.setImage(UIImage(named: "store_back"), for: .normal)
        
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: KNav_Height))
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
    }

}
