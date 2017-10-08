//
//  JJMeNavView.swift
//  SwiftProject
//
//  Created by vpjacob on 2017/10/8.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJMeNavView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    lazy var letfBtn:UIButton = {
       let btn = UIButton(frame: CGRect(x: 12, y: 32, width: 20, height: 20))
        btn.setImage(UIImage(named: "me_pay"), for: UIControlState.normal)
        return btn
    }()
    lazy var rightBtn:UIButton = {
        let btn = UIButton(frame: CGRect(x: self.bounds.width - 32, y: 32, width: 30, height: 20))
        btn.setImage(UIImage(named: "me_invent"), for: UIControlState.normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(letfBtn)
        self.addSubview(rightBtn)
//        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
