//
//  XKTabBar.swift
//  XKTabbedSplitViewController
//
//  Created by DengYikai on 11/14/15.
//  Copyright © 2015 Safaride. All rights reserved.
//

import UIKit

class XKTabBarItem {
    
    var title:String?
    var image:UIImage?
    var selectedImage:UIImage?
    var viewController:UIViewController?
    
    init() {
        
        self.title = ""
        self.image = UIImage(named: "");
        self.selectedImage = UIImage(named: "");
        self.viewController = nil
    }
    
    init(vc:UIViewController?, image:UIImage?, selectedImage:UIImage?, title:String?) {
        
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        self.viewController = vc
    }
}