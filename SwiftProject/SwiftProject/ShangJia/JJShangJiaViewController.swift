//
//  JJShangJiaViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit


fileprivate let padding:CGFloat = 5.0
fileprivate let margin:CGFloat = 12.0
fileprivate let itemSizeSection2 = (Screen_Width - 2 * margin - 2 * padding - 3) / 3

class JJShangJiaViewController: JJBaseViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func initData() {
        self.dataSource = [
            [["":""],],
            [["":""],],
            [["img":"store_zx1","title":"人气招牌美食"],["img":"store_zx2","title":"人气招牌美食"],["img":"store_zx3","title":"人气招牌美食"],["img":"store_zx4","title":"人气招牌美食"],["img":"store_zx5","title":"人气招牌美食"],["img":"store_zx6","title":"人气招牌美食"],],
            [["img":"store_sj1","title":"北京麦当劳凯旋城","saleCount":"33","distance":"亚运村281m"],["img":"store_sj1","title":"北京麦当劳凯旋城","saleCount":"33","distance":"亚运村281m"],],
        ]
    }
    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        initData()
        super.viewDidLoad()
        if !UserDefaults.standard.bool(forKey: isLogin) {
            self.present(JJLogViewController(), animated: true, completion: nil)
        }
        self.title = "商家"
        
        setupUI()
        
    }
    
    // MARK: - navAction
    func leftAction() {
        
    }
    
    func searchAction() {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + KStatusBar
        if offsetY > 0 && offsetY <= KNav_Height {
            shangjiaNav.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(offsetY/KNav_Height)
        }else if (offsetY > KNav_Height){
            shangjiaNav.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(offsetY/KNav_Height)
        }else{
            UIView.animate(withDuration: 0.1, animations: {
                //                    self.nav?.backgroundColor?.withAlphaComponent(1)
                
                self.shangjiaNav.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(-offsetY/KNav_Height)
            }, completion: { (_) in
                
            })
        }
        
    }

    
    func setupUI() {
        self.view.addSubview(collectionView)
        self.view.addSubview(shangjiaNav)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - collectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array = self.dataSource[section] as! [Dictionary<String,Any>]
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJShangJiaTopCollectionViewCell", for: indexPath) as! JJShangJiaTopCollectionViewCell
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJShangJiaADCollectionViewCell", for: indexPath) as! JJShangJiaADCollectionViewCell
            cell.backgroundColor = UIColor.gray
            return cell
        }
        
        let array = self.dataSource[indexPath.section] as! [Dictionary<String,Any>]
        
        
        if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJShangJiaHotCollectionViewCell", for: indexPath) as! JJShangJiaHotCollectionViewCell
            cell.imageView.image = UIImage(named: array[indexPath.row]["img"] as! String)
            cell.titleLabel.text = array[indexPath.row]["title"] as? String
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJNearByCollectionViewCell", for: indexPath) as! JJNearByCollectionViewCell
        cell.imageView.image = UIImage(named: array[indexPath.row]["img"] as! String)
        cell.titleLabel.text = array[indexPath.row]["title"] as? String
        cell.saleCountLabel.text = array[indexPath.row]["saleCount"] as? String
        cell.distanceLabel.text = array[indexPath.row]["distance"] as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            if indexPath.section == 3 || indexPath.section == 2 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJShangJiaHotHeaderView", for: indexPath) as! JJShangJiaHotHeaderView
                if indexPath.section == 2 {
                    header.title.text = "为你甄选"
                }else{
                    header.title.text = "附近商家"
                }
                return header
                
            }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "nilHeader", for: indexPath)
            return header
            
        }else{
            if indexPath.section == 0 {
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionFooter, withReuseIdentifier: "JJShangJiaFooterCollectionReusableView", for: indexPath)
                return footer
            }
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionFooter, withReuseIdentifier: "nilFooter", for: indexPath)
            footer.backgroundColor = UIColor.gray
            return footer
        }
    }
    
    
    // MARK: - size Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: Screen_Width, height: 330)
        }
        if indexPath.section == 1 {
            return CGSize(width: Screen_Width, height: 70)
        }
        
        if indexPath.section == 2 {
            return CGSize(width: itemSizeSection2, height: 120)
        }
        
        return CGSize(width: Screen_Width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 || section == 3 {
          return  CGSize(width: Screen_Width, height: 34)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: Screen_Width, height: 45)
        }
        
        if section == 2 {
            return CGSize(width: Screen_Width, height: 15)
        }
        return CGSize(width: 0, height: 0)
    }
    
    
    // MARK: - margin layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 2 {
            return UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        }
        return .zero
    }
    
    // MARK: - lazy
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(JJShangJiaTopCollectionViewCell.self, forCellWithReuseIdentifier: "JJShangJiaTopCollectionViewCell")
        collectionView.register(UINib.init(nibName: "JJShangJiaADCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJShangJiaADCollectionViewCell")
        collectionView.register(UINib.init(nibName: "JJShangJiaHotCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJShangJiaHotCollectionViewCell")
        collectionView.register(UINib.init(nibName: "JJNearByCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJNearByCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.register(UINib.init(nibName: "JJShangJiaFooterCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "JJShangJiaFooterCollectionReusableView")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "nilFooter")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "nilHeader")
        collectionView.register(UINib.init(nibName: "JJShangJiaHotHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJShangJiaHotHeaderView")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    lazy var shangjiaNav: JJShangjiaNav = {
        let nav = JJShangjiaNav(frame: .zero)
        nav.leftBtn.addTarget(self, action:#selector(leftAction), for: .touchUpInside)
        nav.searchBtn.addTarget(self, action:#selector(searchAction), for: .touchUpInside)
        return nav
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
