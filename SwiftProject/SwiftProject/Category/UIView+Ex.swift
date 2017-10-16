//
//  UIView+Ex.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/16.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    public var x : CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var f = self.frame
            f.origin.x = newValue
            self.frame = f
        }
    }
    /// y
    public var y : CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var f = self.frame
            f.origin.y = newValue
            self.frame = f
        }
    }
    /// width
    public var width : CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var f = self.frame
            f.size.width = newValue
            self.frame = f
        }
    }
    /// height
    public var height : CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var f = self.frame
            f.size.height = newValue
            self.frame = f
        }
    }
    /// origin
    public var origin : CGPoint {
        get {
            return self.frame.origin
        }
        set {
            var f = self.frame
            f.origin = newValue
            self.frame = f
        }
    }
    /// size
    public var size : CGSize {
        get {
            return self.frame.size
        }
        set {
            var f = self.frame
            f.size = newValue
            self.frame = f
        }
    }
    /// centerX
    public var centerX : CGFloat {
        get {
            return self.center.x
        }
        set {
            var c = self.center
            c.x = newValue
            self.center = c
        }
    }
    /// centerY
    public var centerY : CGFloat {
        get {
            return self.center.y
        }
        set {
            var c = self.center
            c.y = newValue
            self.center = c
        }
    }
    

}
