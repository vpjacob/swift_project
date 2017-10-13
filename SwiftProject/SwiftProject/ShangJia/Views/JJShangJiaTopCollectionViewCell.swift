//
//  JJShangJiaTopCollectionViewCell.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/12.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import FSPagerView


class JJShangJiaTopCollectionViewCell: UICollectionViewCell,FSPagerViewDataSource,FSPagerViewDelegate {
    
    var buttons:[UIButton]?
    var buttons2:[UIButton]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.contentView.addSubview(bannerView)
        self.contentView.addSubview(imageViewBackground)
        self.imageViewBackground.addSubview(scrollView)
        let margin = (Screen_Width - 24 - 50 * 5)/4.0
        buttons = UIButton.buttonWithArray(title: ["生鲜水果","甜点饮品","优选超市","时尚购","休闲娱乐","家居生活","宠物","摄影写真","母婴亲子","运动健身",], img: ["store_ms","store_ylxx","store_syls","store_ggcm","store_glzx","store_fdc","store_fdc","store_shfw","store_yl","store_fdc",], tag: 1, margin: margin, padding: 12, superView: scrollView) as [UIButton]
        buttons2 = UIButton.buttonWithArray(title: ["addda","aa","aa","aa","aa","aa","ada","aa","aa","adda",], img: ["store_fdc","store_fdc","store_fdc","store_fdc","store_fdc","store_fdc","store_fdc","store_fdc","store_fdc","store_fdc",], tag: 10, margin: margin, padding: 12 + Screen_Width, superView: scrollView) as [UIButton]
        for btn in buttons! {
            btn.addTarget(self, action: #selector(btnAction(button:)), for: UIControlEvents.touchUpInside)
        }
        for btn in buttons2! {
            btn.addTarget(self, action: #selector(btnAction(button:)), for: UIControlEvents.touchUpInside)
        }
        
    }
    
    func btnAction(button:UIButton) {
        print("00000" + button.tag.description)
    }
    
    
//     MARK: - lazy
    lazy var imageViewBackground: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y:150, width: Screen_Width, height: 200))
        imageView.image = UIImage(named: "store_ol9")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
        lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView(frame: CGRect(x: 0, y: 20, width: Screen_Width, height: 150))
            scrollView.contentSize = CGSize(width: Screen_Width * 2, height: 150)
            scrollView.isPagingEnabled = true
            scrollView.bounces = false
            return scrollView
        }()
    
    
    // MARK: - banner
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 2
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        cell.imageView?.image = UIImage(named: "store_background")
        return cell
    }
    
    lazy var bannerView: FSPagerView = {
        let bannerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 200))
        bannerView.dataSource = self
        bannerView.delegate = self
        bannerView.isInfinite = true
        bannerView.automaticSlidingInterval = 2.0
        bannerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        return bannerView
    }()
    
}
