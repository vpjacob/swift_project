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
        [["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],],
        [["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],],
        [["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],["name":"金蛋","icon":"me_goldegg"],]
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        let leftImage = UIImage(named: "me_more@2x")
        let leftBtn = UIBarButtonItem(image: leftImage, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = leftBtn
        self.navigationItem.leftBarButtonItem = leftBtn
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

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
        }
        
        
        return CGSize(width: Screen_Width * 0.25 - 1, height: 90)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        
//    }
    
    
    
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
        return collectionView
    }()

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
//    }
}
