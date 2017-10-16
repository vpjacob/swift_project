//
//  JJSliderView.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/16.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit


let kSliderViewButtonTag = 100
fileprivate var titles:[String]?

class JJSliderView: UIView {

    
    init(frame:CGRect,buttonTitles:[String]) {
        super.init(frame: frame)
        titles = buttonTitles
        self.addSubview(leftBtn)
        self.addSubview(rightBtn)
        self.addSubview(indexLine)
        self.addSubview(intervalLine)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func selectedButton(btn:UIButton) {
        let tag = btn.tag - kSliderViewButtonTag
        var selected:Bool = true
        
        if tag == 0 {
            selected = false
        }else{
            selected = true
        }
        leftBtn.isSelected = !selected
        rightBtn.isSelected = selected
        scrollToIndex(index: tag)
    }
    func scrollToIndex(index:NSInteger) {
        UIView.animate(withDuration: 0.5, animations: {
            self.indexLine.frame = CGRect(x: 20.0 + CGFloat(index) * self.leftBtn.width , y: 39, width: self.leftBtn.width - 40, height: 1)
        })
    }

    
    lazy var leftBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: (Screen_Width - 0.5) * 0.5, height: 40))
        btn.tag = 0 + kSliderViewButtonTag
        btn.addTarget(self, action: #selector(selectedButton(btn:)), for: .touchUpInside)
        btn.setTitle(titles?[0], for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.isSelected = true
        btn.setTitleColor(UIColor.red, for: .selected)
        return btn
    }()
    
    lazy var rightBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: Screen_Width * 0.5, y: 0, width: (Screen_Width - 0.5) * 0.5, height: 40))
        btn.addTarget(self, action: #selector(selectedButton(btn:)), for: .touchUpInside)
        btn.tag = 1 + kSliderViewButtonTag
        btn.setTitle(titles?[1], for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitleColor(UIColor.red, for: .selected)
        return btn
    }()
    lazy var intervalLine: UIView = {
        let line = UIView(frame: CGRect(x: self.leftBtn.width, y: (40 - 22) / 2, width: 0.5, height: 22))
        line.backgroundColor = UIColor.red
        return line
    }()
    
    lazy var indexLine: UIView = {
        let line = UIView(frame: CGRect(x: 20, y: 39, width: self.leftBtn.width - 40, height: 1))
        line.backgroundColor = UIColor.red
        return line
    }()
    
}
