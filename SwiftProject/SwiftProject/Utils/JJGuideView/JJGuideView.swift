//
//  JJGuideView.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/9.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJGuideView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(scrollView)
        
    }
    
    var startButton: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setBackgroundImage(UIImage(named: "nowregistbutton"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(startAction), for: UIControlEvents.touchUpInside)
        btn.frame = CGRect(origin: CGPoint(x: Screen_Width * 0.5 + Screen_Width * 3, y: Screen_Height - 50), size: CGSize(width: 200, height: 40))
        btn.center = CGPoint(x: Screen_Width * 0.5, y: Screen_Height - 50)
        return btn
    }()
    
    func startAction() {
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.alpha = 0.0
                        self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        },
                       completion: {(finished) -> Void in
                        self.removeFromSuperview()
        }
        )
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: Screen_Frame())
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: Screen_Width * 4, height: Screen_Height)
        for i in 0...3{
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * Screen_Width, y: 0, width: Screen_Width, height: Screen_Height))
            imageView.image = UIImage(named: "welcome_" + (i+1).description)
            if i == 3 {
                imageView.isUserInteractionEnabled = true
                imageView.addSubview(self.startButton)
            }else{
                
            }
            scrollView.addSubview(imageView)
        }
        return scrollView
    }()
    
}
