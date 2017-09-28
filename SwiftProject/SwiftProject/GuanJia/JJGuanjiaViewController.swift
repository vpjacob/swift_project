//
//  JJGuanjiaViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//  13671

import UIKit

class JJGuanjiaViewController: JJBaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(jjCollectionView)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJGuanJiaCollectionViewCell", for: indexPath)
        
        
        
        return cell
    }
    
    lazy var jjCollectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let rect = CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height)
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: flowLayout)
        collectionView.register(UINib.init(nibName: "JJGuanJiaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJGuanJiaCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    lazy var headerView:UIView = {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 200))
        let imageView = UIImageView(image: UIImage(named: "banner"))
        header.addSubview(imageView)
        return header
    }()

}
