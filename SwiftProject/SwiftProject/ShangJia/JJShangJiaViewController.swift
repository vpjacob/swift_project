//
//  JJShangJiaViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJShangJiaViewController: JJBaseViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        super.viewDidLoad()
        if !UserDefaults.standard.bool(forKey: isLogin) {
            self.present(JJLogViewController(), animated: true, completion: nil)
        }
        self.title = "商家"
        
        setupUI()
        
    }

    func setupUI() {
        self.view.addSubview(collectionView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    // MARK: - size Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Screen_Width, height: Screen_Height)
    }
    
    
    // MARK: - margin layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    // MARK: - lazy
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        
        
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
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

}
