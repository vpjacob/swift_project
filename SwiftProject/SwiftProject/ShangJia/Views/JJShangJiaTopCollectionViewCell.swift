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
    }
    
    
    // MARK: - lazy
    lazy var imageViewBackground: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y:150, width: Screen_Width, height: 200))
        imageView.backgroundColor = UIColor.clear
        imageView.image = UIImage(named: "store_ol9")
        return imageView
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
