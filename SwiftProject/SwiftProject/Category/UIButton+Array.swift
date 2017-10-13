//
//  UIButton+Array.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/12.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    
    static func buttonWithArray(title:[String],img:[String],tag:NSInteger,margin:CGFloat,padding:CGFloat,superView:UIView) -> [UIButton] {
        let btnArray:NSMutableArray = NSMutableArray() 
        
        for i in 0 ... title.count - 1{
            let btn = UIButton(type: UIButtonType.custom)
            let x = padding + CGFloat(i % 5) * (margin + 50)
            let y = (12 * 2 + 50.0) * CGFloat(i / 5)
            btn.frame = CGRect(x: x, y: y, width: 50, height: 50)
            let label = UILabel()
            label.text = title[i]
            label.font = UIFont.systemFont(ofSize: 11)
            label.sizeToFit()
            label.center = CGPoint(x: btn.center.x, y: btn.center.y + 35)
            btn.tag = tag + i
            superView.addSubview(label)
            btn.setImage(UIImage(named: img[i]), for: .normal)
            btnArray.add(btn)
            superView.addSubview(btn)
        }
        
        return btnArray as! [UIButton]
    }
    
    
}
