//
//  JJGuanjiaViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//  13671

import UIKit

class JJGuanjiaViewController: JJBaseViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
    
    func initData() {
       self.dataSource = [
        [["icon":"kmjl","name":"开门记录"],["icon":"yjkm","name":"一键开门"],["icon":"mksp","name":"门口视频"],["icon":"mjys","name":"门禁钥匙"],],
        [["icon":"xqgg","name":"小区公共"],["icon":"lxwy","name":"联系物业"],["icon":"sswx","name":"设备维修"],["icon":"gd","name":"更多"],],
        [["icon":"wdfw","name":"我的房屋"],["icon":"sqfk","name":"授权访客"],["icon":"wscy","name":"我是成员"],["icon":"guanjia_shezhi","name":"设置"],]
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        initData()
        self.view.addSubview(jjCollectionView)

        
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array = self.dataSource[section] as! [Dictionary<String, Any>]
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJGuanJiaCollectionViewCell", for: indexPath) as! JJGuanJiaCollectionViewCell
        let array = self.dataSource[indexPath.section] as! [Dictionary<String, Any>]
        
        cell.name_title.text = array[indexPath.row]["name"] as? String
        cell.icon_imageView.image = UIImage(named: (array[indexPath.row]["icon"] as? String)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item" + indexPath.section.description + indexPath.row.description)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "JJHomeBannerCollectionReusableView", for: indexPath)
            return header
        }
        
        let header  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "JJTitleCollectionReusableView", for: indexPath)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: Screen_Width, height: 200)
        }
        return CGSize(width: Screen_Width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 0 {
        return CGSize(width: Screen_Width * 0.25, height: 100)
        }
        return CGSize(width: Screen_Width * 0.25, height: 75)
    }
    
    
    lazy var jjCollectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let rect = CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height)
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: flowLayout)
        collectionView.register(UINib.init(nibName: "JJGuanJiaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJGuanJiaCollectionViewCell")
        collectionView.register(UINib.init(nibName: "JJHomeBannerCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeBannerCollectionReusableView")
        collectionView.register(UINib.init(nibName: "JJTitleCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJTitleCollectionReusableView")
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    lazy var headerView:UIView = {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 200))
        let imageView = UIImageView(image: UIImage(named: "banner"))
        header.addSubview(imageView)
        return header
    }()

}
