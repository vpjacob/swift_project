//
//  PCHFile.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/9/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import Foundation
import UIKit


public let Screen_Width = UIScreen.main.bounds.size.width
public let Screen_Height = UIScreen.main.bounds.size.height
public let KTabbar_Height:CGFloat = 49.0
public let KNav_Height:CGFloat = 64.0
public let KStatusBar:CGFloat = 20.0
public let isLogin:String = "isLogin"


//获取视图尺寸
public func VIEW_WIDTH(view:UIView)->CGFloat{
    return view.frame.size.width
}
public func VIEW_HEIGHT(view:UIView)->CGFloat{
    return view.frame.size.height
}

public func Screen_Frame() -> CGRect {
    return CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height)
}

func System_AppVersion() -> String {
    let infoDic = Bundle.main.infoDictionary
    let appVersion = infoDic?["CFBundleShortVersionString"]
  return appVersion as! String
}

func System_AppBuildVersion() -> String {
    let infoDic = Bundle.main.infoDictionary
    let appBuildVersion = infoDic?["CFBundleVersion"]
    return appBuildVersion as! String
}

func System_AppName() -> String {
    let infoDic = Bundle.main.infoDictionary
    let appName = infoDic?["CFBundleDisplayName"]
    return appName as! String
}

//RGB转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}


extension UIColor {
    
    public func hexStringToColor(hexString: String) -> UIColor{
        
        var cString: String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if cString.characters.count < 6 {
            return UIColor.black
        }
        if cString.hasPrefix("0X") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        }
        if cString.hasPrefix("#") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }
        if cString.characters.count != 6 {
            return UIColor.black
        }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(displayP3Red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
        
    }
}

