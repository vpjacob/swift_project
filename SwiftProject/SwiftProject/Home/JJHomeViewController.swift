//
//  JJHomeViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import FSPagerView

class JJHomeViewController: JJBaseViewController,FSPagerViewDataSource,FSPagerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        initSycleView()
        // Do any additional setup after loading the view.
    }

    func initSycleView() {
        let rect = CGRect(x: 0, y: 0, width: Screen_Width, height: 200)
        
        let sycleView = FSPagerView(frame: rect)
        sycleView.dataSource = self
        sycleView.delegate = self
        sycleView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(sycleView)
        
    }
    
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 2
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        cell.imageView?.image = UIImage(named: "banner")
        cell.textLabel?.text = "banner"
        return cell
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

}
