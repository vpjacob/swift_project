//
//  JJHomeViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import FSPagerView

class JJHomeViewController: JJBaseViewController,FSPagerViewDataSource,FSPagerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func initDatas() {
            self.dataSource = [
        ["header"],
        ["banner"],
        ["1","2","3","4",],
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        initDatas()
        setupUI()
        
        // Do any additional setup after loading the view.
    }

    func setupUI() {

        self.view.addSubview(collectionView)
        
    }
    
    
    // MARK: - FSPagerViewDelegate
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        return 2
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        cell.imageView?.image = UIImage(named: "banner")
        cell.textLabel?.text = "banner"
        return cell
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array:NSArray = dataSource[section] as! NSArray
        
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noCell", for: indexPath)
            cell.backgroundColor = UIColor.yellow
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath)
            cell.contentView.addSubview(sycleView)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJImgViewCollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    

    // MARK: - header&footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeWeatherSectionHeaderView", for: indexPath)
            return headerView
        } else if indexPath.section == 1 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeBannerHeaderView", for: indexPath)
            
            return headerView
        }else{
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeSectionHeaderView", for: indexPath) as! JJHomeSectionHeaderView
        headerView.titleLabel.textColor = UIColor.red
        headerView.titleView.backgroundColor = UIColor.red
        return headerView
        }
    }
    
    // MARK: - collectionviewflowlayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: Screen_Width, height: 1)
        }
        return CGSize(width: Screen_Width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: Screen_Width, height: 319)
        } else if section == 1{
            return CGSize(width: Screen_Width, height: 43)
        }
        return CGSize(width: Screen_Width, height: 38)
    }
    
    // MARK: - lazy
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height), collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        
        view.register(UINib.init(nibName: "JJHomeWeatherSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeWeatherSectionHeaderView")
        view.register(UINib.init(nibName: "JJHomeBannerHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeBannerHeaderView")
        view.register(UINib.init(nibName: "JJHomeSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeSectionHeaderView")
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BannerCell")
        view.register(UINib.init(nibName: "JJImgViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJImgViewCollectionViewCell")
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "noCell")
        
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    lazy var sycleView: FSPagerView = {
        let sycleView = FSPagerView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 200))
        sycleView.dataSource = self
        sycleView.delegate = self
        sycleView.automaticSlidingInterval = 1
        sycleView.isInfinite = true
        sycleView.transformer = FSPagerViewTransformer(type: .overlap)
        sycleView.itemSize = CGSize(width: Screen_Width * 0.85, height: 200)
        sycleView.transformer?.minimumScale = 0.9
        sycleView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        return sycleView
    }()
    
    // MARK: - nav
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

}
