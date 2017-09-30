//
//  JJNavView.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/30.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJNavView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let button = UIButton(type: UIButtonType.contactAdd)
        button.center = self.center
        self.addSubview(button)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
