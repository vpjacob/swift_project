//
//  JJHomeNav.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/11.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

typealias leftBlock = () -> Void
typealias rightBlock = () -> Void


class JJHomeNav: UIView {

    public var leftBlockAction:leftBlock?
    public var rightBlockAction:rightBlock?
    
    lazy var leftBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "home_dz"), for: .normal)
        btn.frame = CGRect(x: padding, y: 30, width: 20, height: 20)
        btn.addTarget(self, action: #selector(leftBtnAction), for: UIControlEvents.touchUpInside)
        return btn
    }()
    lazy var rightBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "home_scan"), for: .normal)
        btn.frame = CGRect(x: Screen_Width - padding - 20, y: 30, width: 20, height: 20)
        btn.addTarget(self, action: #selector(rightBtnAction), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    func leftBtnAction() {
        if leftBlockAction != nil {
            leftBlockAction!()
        }
    }
    func rightBtnAction() {
        if rightBlockAction != nil {
            rightBlockAction!()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: KNav_Height))
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        self.addSubview(leftBtn)
        self.addSubview(rightBtn)
    }
    
}
