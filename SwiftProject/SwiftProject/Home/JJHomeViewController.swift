//
//  JJHomeViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import FSPagerView

let margin:CGFloat = 5.0
let padding:CGFloat = 12.0

class JJHomeViewController: JJBaseViewController,FSPagerViewDataSource,FSPagerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var nav:JJHomeNav?
    
    
    func initDatas() {
            self.dataSource = [
        ["header"],
        ["banner"],
        ["home_tu1","home_tu2","home_tu2","home_tu1",],
        ["home_lx1","home_lx2","home_lx2","home_lx1","home_lx01","home_lx02","home_lx03"],
        [["img":"home_ry1","title":"清新家具陪伴您左右清新家具陪伴您左右"],["img":"home_ry2","title":"清新家具清新家具陪伴您左右陪伴您左右"]],
        [["img":"home_ry1","title":"清新家具清新家具陪伴您左右陪伴您左右"],["img":"home_ry2","title":"清新家具陪伴您清新家具陪伴您左右左右"],["img":"","title":"清新家具清新家具陪伴您左右陪伴您左右"],["img":"","title":"清新家具清新家具陪伴您左右陪伴您左右"],["img":"","title":"清新家清新家具陪伴您左右具陪伴您左右"],["img":"","title":"清新家清新家具陪伴您左右具陪伴您左右"],["img":"","title":"清新家具清新家具陪伴您左右陪伴您左右"]],
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
        nav = JJHomeNav(frame: .zero)
//        nav?.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView)
        self.view.addSubview(nav!)
        nav?.leftBlockAction = {
            print("left   action")
        }
        
        nav?.rightBlockAction = {
            print("right   action")
        }
    }
    
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            if offsetY > 0 && offsetY <= KNav_Height {
                nav?.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(offsetY/KNav_Height)
            }else if (offsetY > KNav_Height){
                nav?.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(offsetY/KNav_Height)
            }else{
                UIView.animate(withDuration: 0.1, animations: {
//                    self.nav?.backgroundColor?.withAlphaComponent(1)
                    
                    self.nav?.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(-offsetY/KNav_Height)
                }, completion: { (_) in
                    
                })
            }
    
        }

    
    
    // MARK: - FSPagerViewDelegate
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        return 2
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        cell.imageView?.image = UIImage(named: "home_jx")
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
        
        if indexPath.section == 2 || indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJImgViewCollectionViewCell", for: indexPath) as! JJImgViewCollectionViewCell
            let array:NSArray = dataSource[indexPath.section] as! NSArray
            cell.imageView.image = UIImage(named: array[indexPath.row] as! String)
            return cell
        }
        if indexPath.section == 4 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJImgViewTitleCollectionViewCell", for: indexPath) as! JJImgViewTitleCollectionViewCell
            let array:NSArray = dataSource[indexPath.section] as! NSArray
            let dic:[String:String] = array[indexPath.row] as! [String : String]
            
            cell.imageView.image = UIImage(named: dic["img"]!)
            cell.titleLabel.text = dic["title"]!
            return cell
        }
        
        if indexPath.section == 5 {
            let array:NSArray = dataSource[indexPath.section] as! NSArray
            let dic:[String:String] = array[indexPath.row] as! [String : String]

            if indexPath.row < 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJNewsImgCollectionViewCell", for: indexPath) as! JJNewsImgCollectionViewCell
                cell.imageView.image = UIImage(named: dic["img"]!)
                cell.titleLabel.text = dic["title"]!
                return cell
            }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJNewsTitleCollectionViewCell", for: indexPath) as! JJNewsTitleCollectionViewCell
            cell.titleLabel.text = dic["title"]!
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
        
        if indexPath.section == 2 || indexPath.section == 3{
            if indexPath.row < 4 {
                if indexPath.row  == 0 || indexPath.row == 3 {
                    return CGSize(width: (Screen_Width - padding * 2 - margin)*0.66, height: 125)
                }else{
                    return CGSize(width: (Screen_Width - padding * 2 - margin)*0.33, height: 125)
                }
            }else{
                return CGSize(width: (Screen_Width - padding * 2 - padding)/3, height: 125)
            }
        }
        
        if indexPath.section == 4 {
            return CGSize(width: Screen_Width - padding * 2 , height: 125)
        }
        
        if indexPath.section == 5 {
            if indexPath.row < 2 {
                return CGSize(width: Screen_Width - padding * 2, height: 100)
            }
            return CGSize(width: Screen_Width - padding * 2, height: 30)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
    // MARK: - lazy
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: 12)
        
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height), collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        
        view.register(UINib.init(nibName: "JJHomeWeatherSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeWeatherSectionHeaderView")
        view.register(UINib.init(nibName: "JJHomeBannerHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeBannerHeaderView")
        view.register(UINib.init(nibName: "JJHomeSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeSectionHeaderView")
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BannerCell")
        view.register(UINib.init(nibName: "JJImgViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJImgViewCollectionViewCell")
        view.register(UINib.init(nibName: "JJImgViewTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJImgViewTitleCollectionViewCell")
        view.register(UINib.init(nibName: "JJNewsImgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJNewsImgCollectionViewCell")
        view.register(UINib.init(nibName: "JJNewsTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJNewsTitleCollectionViewCell")
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
