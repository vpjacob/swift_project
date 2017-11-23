//
//  JJBaseViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJBaseViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
   lazy var jjTabelView:UITableView = {
    let rect = CGRect(x: 0, y: 64, width: Screen_Width, height: Screen_Height - 64)
        let tableview = UITableView(frame: rect, style: UITableViewStyle.plain)
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    lazy var jjGroupTabelView:UITableView = {
        let rect = CGRect(x: 0, y: 64, width: Screen_Width, height: Screen_Height - 64)
        let tableview = UITableView(frame: rect, style: UITableViewStyle.grouped)
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    lazy var dataSource:NSMutableArray = {
        let array = NSMutableArray()
        return array
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
