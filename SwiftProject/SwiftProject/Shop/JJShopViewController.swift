//
//  JJShopViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//,BMKMapViewDelegate

import UIKit

class JJShopViewController: JJBaseViewController{

    var _mapView: BMKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(type: .contactAdd)
        btn.center = self.view.center
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(selectedButton(button:)), for: .touchUpInside)

//        _mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//        self.view.addSubview(_mapView!)
        
    }
    
    func selectedButton(button: UIButton) {
        print("ddddd" + button.tag.description)
        let array = [UIImage(named: "sz"),UIImage(named: "gg"),UIImage(named: "gd")]
        
        
       
        self.pleaseWaitWithImages(array as! Array<UIImage>, timeInterval: 100)
//        self.navigationController?.pushViewController(JJQRCodeViewController(), animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        _mapView?.viewWillAppear()
//        _mapView?.delegate = self // 此处记得不用的时候需要置nil，否则影响内存的释放
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
//        _mapView?.viewWillDisappear()
//        _mapView?.delegate = nil // 不用时，置nil
    }
    

}
