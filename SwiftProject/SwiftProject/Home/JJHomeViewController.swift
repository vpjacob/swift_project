//
//  JJHomeViewController.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import UIKit
import FSPagerView
import CoreData
import GoogleMobileAds
import Alamofire
import SwiftyJSON
import Kingfisher

fileprivate let margin:CGFloat = 5.0
fileprivate let padding:CGFloat = 12.0

class JJHomeViewController: JJBaseViewController,FSPagerViewDataSource,FSPagerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var nav:JJHomeNav?
    
    var adInterstitial = GADInterstitial(adUnitID: "ca-app-pub-9554187975714748/4439146610")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false
        }
        adInit()
        setupUI()
        getData()
        // Do any additional setup after loading the view.
    }
// MARK: - 广告
    func adInit() {
        let gadRequest1 = GADRequest()
        self.adInterstitial.load(gadRequest1)
        
    }
    
    func setupUI() {
        nav = JJHomeNav(frame: .zero)
        self.view.addSubview(collectionView)
        self.view.addSubview(nav!)
        nav?.leftBlockAction = {
            if self.adInterstitial.isReady {
                self.adInterstitial.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
            
            
//            print("left   action")
//            let app = UIApplication.shared.delegate as! AppDelegate
//            let context  = app.persistentContainer.viewContext
//
//            let user = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
//
//            user.age = 12
//            user.name = "dong"
//
//            do {
//                try context.save()
//                print("baocun chenggong")
//            } catch  {
//                fatalError("buneng bao cun")
//            }
        }
        
        
        nav?.rightBlockAction = {
            print("right   action")
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
            fetchRequest.fetchLimit = 10
            fetchRequest.fetchOffset = 0
            
            let predicate = NSPredicate(format: "name= 'dong'", "")
            fetchRequest.predicate = predicate
            
            
            //查询操作
            do {
                let fetchedObjects = try context.fetch(fetchRequest)
                
                //遍历查询的结果
                for info in fetchedObjects{
                    print(info.name ?? "")
                    print(info.age)
                }
            }
            catch {
                fatalError("不能保存：\(error)")
            }
        }
    }
    
    // MARK: - Network
    func getData() {
        let dic = ["script":"mobile.center.homepage.homepage","needTrascation":true,"funName":"queryHomePageInfo","form":[
            ]] as [String : Any]
        
        Alamofire.request(KurlStr, parameters: dic)
            .responseJSON { response in

                self.dataSource = [
                    ["header"],
                ]
                
                let json = JSON(data: response.data!)
//                print("JSON: \(json)")
                
//                print(homeModel!)
                guard let homeModel = JJHomeModel.changeResponseJSONObject(json.rawValue) else {
                    print("网络错误")
                    return
                }
                print((homeModel as! JJHomeModel).formDataset.placeFourList)

                //第1组 轮播
                let strOne:String = (homeModel as! JJHomeModel).formDataset.placeOneList
                let dataOneList = strOne.data(using: String.Encoding.utf8)
                let jsonOneList = JSON(data: dataOneList!)
                let oneListArray = JJHomeRowModel.changeJSONArray(jsonOneList.rawValue as! [Any])
                
                //第2组
                let strTwo:String = (homeModel as! JJHomeModel).formDataset.placeTwoList
                let dataTwoList = strTwo.data(using: String.Encoding.utf8)
                let jsonTwoList = JSON(data: dataTwoList!)
                let twoListArray = JJHomeRowModel.changeJSONArray(jsonTwoList.rawValue as! [Any])
                
                //第3组
                let strThree:String = (homeModel as! JJHomeModel).formDataset.placeThreeList
                let dataThreeList = strThree.data(using: String.Encoding.utf8)
                let jsonThreeList = JSON(data: dataThreeList!)
                let threeListArray = JJHomeRowModel.changeJSONArray(jsonThreeList.rawValue as! [Any])
                
                
                //第4组
                let strFour:String = (homeModel as! JJHomeModel).formDataset.placeFourList
                let dataFourList = strFour.data(using: String.Encoding.utf8)
                let jsonFourList = JSON(data: dataFourList!)
                let fourListArray = JJHomeRowModel.changeJSONArray(jsonFourList.rawValue as! [Any])
                
                self.dataSource.add(oneListArray!)
                self.dataSource.add(twoListArray!)
                self.dataSource.add(threeListArray!)
                self.dataSource.add(fourListArray!)
                
                DispatchQueue.main.async(execute: {
                    self.collectionView.reloadData()
                })
                
        }
    }
    
    
    // MARK: - nav
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            if offsetY > 0 && offsetY <= KNav_Height {
                nav?.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(offsetY/KNav_Height)
            }else if (offsetY > KNav_Height){
                nav?.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(offsetY/KNav_Height)
            }else{
                UIView.animate(withDuration: 0.1, animations: {
                    
                    self.nav?.backgroundColor = UIColor().hexStringToColor(hexString: "#ff602f").withAlphaComponent(-offsetY/KNav_Height)
                }, completion: { (_) in
                    
                })
            }
    
        }

    // MARK: - FSPagerViewDelegate
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        let array:NSArray = dataSource[1] as! NSArray
        
        return array.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let array:NSArray = dataSource[1] as! NSArray
        let model = array[index] as! JJHomeRowModel
        cell.imageView?.kf.setImage(with: URL(string: model.img_url))
        cell.textLabel?.text = "banner"
        return cell
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array:NSArray = dataSource[section] as! NSArray
        if section == 1{
            return 1
        }
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {//
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noCell", for: indexPath)
            cell.backgroundColor = UIColor.yellow
            return cell
        }
        
        if indexPath.section == 1 {//轮播图
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath)
            cell.contentView.addSubview(sycleView)
            return cell
        }
        
        if indexPath.section == 2 || indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJImgViewCollectionViewCell", for: indexPath) as! JJImgViewCollectionViewCell
            let array:NSArray = dataSource[indexPath.section] as! NSArray
            let model = array[indexPath.row] as! JJHomeRowModel
            cell.imageView.kf.setImage(with: URL(string: model.img_url))
            return cell
        }
        if indexPath.section == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJImgViewTitleCollectionViewCell", for: indexPath) as! JJImgViewTitleCollectionViewCell
            let array:NSArray = dataSource[indexPath.section] as! NSArray
            let model = array[indexPath.row] as! JJHomeRowModel
            cell.imageView.kf.setImage(with: URL(string: model.img_url))
            return cell
        }
        
        if indexPath.section == 5 {
            if indexPath.row < 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJNewsImgCollectionViewCell", for: indexPath) as! JJNewsImgCollectionViewCell
                return cell
            }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJNewsTitleCollectionViewCell", for: indexPath) as! JJNewsTitleCollectionViewCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJImgViewCollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(JJqqqqViewController(), animated: true)
    }

    // MARK: - header&footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeWeatherSectionHeaderView", for: indexPath)
            return headerView
        } else if indexPath.section == 1 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeBannerHeaderView", for: indexPath)
            
            return headerView
        }else{
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeSectionHeaderView", for: indexPath) as! JJHomeSectionHeaderView
        headerView.titleLabel.textColor = UIColor.red
        headerView.titleView.backgroundColor = UIColor.red
        return headerView
        }
    }
    
    // MARK: - collectionviewflowlayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: Screen_Width, height: 1)
        }
        
        if indexPath.section == 1 {
            return CGSize(width: Screen_Width, height: 200)
        }
        
        if indexPath.section == 2 || indexPath.section == 3{
            if indexPath.row < 4 {
                if indexPath.row  == 0 || indexPath.row == 3 {
                    return CGSize(width: (Screen_Width - padding * 2 - margin)*0.66, height: 125)
                }else{
                    return CGSize(width: (Screen_Width - padding * 2 - margin)*0.33, height: 125)
                }
            }else{
                return CGSize(width: (Screen_Width - padding * 2 - padding)/3, height: 125)
            }
        }
        
        if indexPath.section == 4 {
            return CGSize(width: Screen_Width - padding * 2 , height: 125)
        }
        
        if indexPath.section == 5 {
            if indexPath.row < 2 {
                return CGSize(width: Screen_Width - padding * 2, height: 100)
            }
            return CGSize(width: Screen_Width - padding * 2, height: 30)
        }
        
        return CGSize(width: Screen_Width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: Screen_Width, height: 319)
        } else if section == 1{
            return CGSize(width: Screen_Width, height: 43)
        }
        return CGSize(width: Screen_Width, height: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 || section == 1 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
    // MARK: - lazy
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height - KTabbar_Height), collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        
        view.register(UINib.init(nibName: "JJHomeWeatherSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeWeatherSectionHeaderView")
        view.register(UINib.init(nibName: "JJHomeBannerHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeBannerHeaderView")
        view.register(UINib.init(nibName: "JJHomeSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JJHomeSectionHeaderView")
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BannerCell")
        view.register(UINib.init(nibName: "JJImgViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJImgViewCollectionViewCell")
        view.register(UINib.init(nibName: "JJImgViewTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJImgViewTitleCollectionViewCell")
        view.register(UINib.init(nibName: "JJNewsImgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJNewsImgCollectionViewCell")
        view.register(UINib.init(nibName: "JJNewsTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JJNewsTitleCollectionViewCell")
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "noCell")
        
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    lazy var sycleView: FSPagerView = {
        let sycleView = FSPagerView(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 200))
        sycleView.dataSource = self
        sycleView.delegate = self
        sycleView.automaticSlidingInterval = 1
        sycleView.isInfinite = true
        sycleView.transformer = FSPagerViewTransformer(type: .overlap)
        sycleView.itemSize = CGSize(width: Screen_Width * 0.85, height: 200)
        sycleView.transformer?.minimumScale = 0.9
        sycleView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        return sycleView
    }()
    
    // MARK: - nav
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

}
