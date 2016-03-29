//
//  File.swift
//  XKTabbedSplitViewController
//
//  Created by DengYikai on 3/25/16.
//  Copyright © 2016 Safaride. All rights reserved.
//

import UIKit

class XKMasterViewController: UIViewController {
    
    var _viewController: UIViewController?
    var viewController: UIViewController? {
        
        set {
            
            if newValue != nil {
                
                var oldVC:UIViewController? = nil
                
                if _viewController != nil {
                    
                    oldVC = _viewController!
                }
                
                _viewController = newValue
                _viewController!.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
                _viewController!.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
                
                self.addChildViewController(_viewController!)
                self.view.addSubview(_viewController!.view)
                
                if oldVC != nil {
                    
                    oldVC!.view.removeFromSuperview()
                    oldVC!.removeFromParentViewController()
                }
            }
        }
        
        get {
            
            return _viewController
        }
    }
    
    init () {
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.frame = CGRectMake(70, 0, 320, self.view.bounds.size.height)
        self.view.clipsToBounds = true
        self.view.backgroundColor = UIColor.clearColor()
    }
    
    init (frame:CGRect) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.frame = frame
        self.view.clipsToBounds = true
        self.view.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func shouldAutorotate() -> Bool {
        
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
        return UIInterfaceOrientationMask.All
    }
}
