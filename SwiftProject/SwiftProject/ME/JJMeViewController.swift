//
//  JJMeViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJMeViewController: JJBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJGuanJiaCollectionViewCell", for: indexPath) as! JJGuanJiaCollectionViewCell
        cell.backgroundColor = UIColor.red
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
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
