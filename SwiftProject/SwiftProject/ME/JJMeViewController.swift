//
//  JJMeViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJMeViewController: JJBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func initData() {
        self.dataSource = [
        [["name":"金蛋","icon":"me_goldegg"]],
        [["name":"我的钱包","icon":"me_goldegg"],["name":"扫一扫","icon":"me_layer3"],["name":"订单","icon":"me_order"],["name":"金蛋","icon":"me_goldegg"],["name":"回购","icon":"me_crash"],["name":"金币明细","icon":"me_coin"],["name":"支付明细","icon":"me_pay"],["name":"物流","icon":"me_logistic"],["name":"小客福利","icon":"me_gift"],],
        [["name":"设备","icon":"me_equipment"],["name":"推荐","icon":"me_invent"],["name":"反馈","icon":"me_issue"],["name":"更多","icon":"me_more@2x"],],
        [["name":"家居用品","icon":"me_image1"],["name":"家居用品","icon":"me_image2"],["name":"家居用品","icon":"me_image3"],]
        ]
    }
    
    var navBar:UINavigationBar?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navBar = self.navigationController?.navigationBar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        initData()
        let leftImage = UIImage(named: "me_more@2x")
        let leftBtn = UIBarButtonItem(image: leftImage, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = leftBtn
        self.navigationItem.leftBarButtonItem = leftBtn
        
        navBar = self.navigationController?.navigationBar

        self.view.addSubview(collectionView)
        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array = self.dataSource[section] as! [Dictionary<String,Any>]
        
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJMeHeaderSectionCollectionViewCell", for: indexPath)
            return cell
        }else if(indexPath.section == 1 && indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJMeSectionTitleCollectionViewCell", for: indexPath) as! JJMeSectionTitleCollectionViewCell
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJGuanJiaCollectionViewCell", for: indexPath) as! JJGuanJiaCollectionViewCell
        cell.backgroundColor = UIColor.red
        let array = self.dataSource[indexPath.section] as! [Dictionary<String,Any>]
        
        cell.icon_imageView.image = UIImage(named: array[indexPath.row]["icon"] as! String)
        cell.name_title.text = array[indexPath.row]["name"] as? String
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 0 {
            return CGSize(width: Screen_Width, height: 219)
        }else if(indexPath.section == 1 && indexPath.row == 0){
            return CGSize(width: Screen_Width, height: 40)
        }
        
        return CGSize(width: Screen_Width * 0.25 - 1, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "cellFooter", for: indexPath)
        footer.backgroundColor = UIColor.white
        
        return footer
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 0 || section == 3){
            return CGSize.zero
        }
        return CGSize(width: Screen_Width, height: 50)
    }
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 2
        flowLayout.minimumInteritemSpacing = 0
        
        let rect = CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height)
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "JJGuanJiaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJGuanJiaCollectionViewCell")
        collectionView.register(UINib.init(nibName: "JJMeHeaderSectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJMeHeaderSectionCollectionViewCell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "cellFooter")
        collectionView.register(UINib.init(nibName: "JJMeSectionTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJMeSectionTitleCollectionViewCell")
        return collectionView
    }()

}
