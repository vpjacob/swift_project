//
//  JJShangjiaNav.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/11.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import SnapKit

class JJShangjiaNav: UIView {
    
   public var leftBtn:UIButton = {
       let btn = UIButton(type: UIButtonType.custom)
        
        btn.setImage(UIImage(named: "store_back"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitle("北京", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        btn.sizeToFit()
        return btn
    }()
    
   public var searchBtn:UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        
        btn.setBackgroundImage(UIImage(named: "store_RoundedRectangle1"), for: .normal)
        btn.setImage(UIImage(named: "store_search"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btn.setTitle("输入商家位置", for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        btn.sizeToFit()
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
        self.addSubview(leftBtn)
        self.addSubview(searchBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.centerYWithinMargins.equalTo(5)
            make.bottom.equalTo(KNav_Height - 10)
            make.width.equalTo(Screen_Width * 0.5 - 90)
            make.left.equalTo(5)
        }
        searchBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 160, height: 30))
            make.center.equalTo(CGPoint(x: Screen_Width * 0.5, y: KNav_Height * 0.5 + 5))
//            make.centerX.equalTo(Screen_Width * 0.5)
//            make.bottom.equalTo(KNav_Height - 10)
        }
    }

}
