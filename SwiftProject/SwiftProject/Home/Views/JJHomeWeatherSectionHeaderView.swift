//
//  JJHomeWeatherSectionHeaderView.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/10.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit

class JJHomeWeatherSectionHeaderView: UICollectionReusableView {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        scrollView.contentSize = CGSize(width: 2.0 * Screen_Width, height: self.bounds.size.height)
        scrollView.isPagingEnabled = true
        
        for i in 1...2{
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i-1)*Screen_Width, y: 0, width: Screen_Width, height: self.bounds.size.height))
            
            imageView.image = UIImage(named: "home_duang" + i.description)
            scrollView.addSubview(imageView)
        }
        
        
    }
    
}
