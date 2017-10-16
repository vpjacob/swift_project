//
//  JJShopViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJShopViewController: JJBaseViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        let sliderView = JJSliderView(frame: CGRect(x: 0, y: 64, width: Screen_Width, height: 40), buttonTitles: ["左面","右面"])
        self.view.addSubview(sliderView)
        
        // Do any additional setup after loading the view.
    }
    
    func selectedButton(button: UIButton) {
        print("ddddd" + button.tag.description)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
