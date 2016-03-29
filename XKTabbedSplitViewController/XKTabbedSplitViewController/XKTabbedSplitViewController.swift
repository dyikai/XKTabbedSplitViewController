//
//  XKTabbedSplitViewController.swift
//  XKTabbedSplitViewController
//
//  Created by DengYikai on 3/28/16.
//  Copyright © 2016 Safaride. All rights reserved.
//

import UIKit

class XKTabbedSplitViewController: UIViewController, XKTabBarDelegate {
    
    private var masterVC: XKMasterViewController?
    private var detailVC: XKDetailViewController?
    private var isMasterHidden: Bool = false
    
    var tabBar: XKTabBar?
    
    
    var _background: UIColor?
    var background: UIColor? {
        
        set {
            
            _background = newValue
            tabBar!.view.backgroundColor = newValue
            masterVC!.view.backgroundColor = newValue
            detailVC!.view.backgroundColor = newValue
        }
        
        get {
            
            return _background
        }
    }
    
    var _tabsViewControllers: [XKTabBarItem]?
    var tabsViewControllers: [XKTabBarItem]? {
        
        set {
            
            _tabsViewControllers = newValue
            tabBar!.tabsButtons = _tabsViewControllers
        }
        
        get {
            
            return _tabsViewControllers
        }
    }
    
    var _viewControllers: [UIViewController]?
    var viewControllers: [UIViewController] {
        
        set {
            _viewControllers = newValue
            
            masterVC!.viewController = self.viewControllers[0]
            detailVC!.viewController = self.viewControllers[1]
        }
        
        get {
            
            if _viewControllers == nil {
                
                return [UIViewController()]
            } else {
                
                return _viewControllers!
            }
        }
    }
    
    var masterViewController: UIViewController? {
        
        get {
            
            if masterVC == nil {
                
                return nil
            } else {
                
                return masterVC!.viewController
            }
        }
    }
    
    var detailViewController: UIViewController? {
        
        set {
            
            detailVC!.viewController = newValue
        }
        
        get {
            
            if detailVC == nil {
                
                return nil
            } else {
                
                return detailVC!.viewController
            }
        }
    }
    
    //MARK: Inititalization
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tabBar = XKTabBar()
        tabBar!.delegate = self
        masterVC = XKMasterViewController()
        detailVC = XKDetailViewController()
    }
    
    //MARK: ViewController Lifecycle
    override func loadView() {
        
        super.loadView()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(tabBar!.view)
        self.view.addSubview(masterVC!.view)
        self.view.addSubview(detailVC!.view)
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        if isMasterHidden {
            return
        }
        
//        var appFrame: CGRect = UIScreen.mainScreen().applicationFrame
//        
        let isPortrait: Bool = UIInterfaceOrientationIsPortrait(UIApplication.sharedApplication().statusBarOrientation)
//        var iOSVersionLowerThan8: Bool = Float(UIDevice.currentDevice().systemVersion) < 8.0
        
        // DetailViewController's Frame
        var detailFrame: CGRect = self.detailFrame()
        let widthDif: CGFloat = isPortrait ? 10 : 0
        detailFrame.origin.y += 85
        detailFrame.size.height -= 85
        detailVC!.view.frame = detailFrame
        
        // MasterViewController's Frame
        var masterFrame: CGRect = self.masterFrame()
        masterFrame.size.width -= widthDif
        masterFrame.size.height -= 85
        masterFrame.origin.y += 85
        masterVC!.view.frame = masterFrame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Frame
    func masterFrame() -> CGRect {
        
        return CGRectMake(96, 0, 232, self.view.bounds.size.height)
    }
    
    func detailFrame() -> CGRect {
        
        return CGRectMake(96 + 232 + 1, 0, self.view.bounds.size.width - 1 + 88, self.view.bounds.size.height)
    }
    
    //MARK: Actions
    func hideMaster() -> Void {
        
        let transitionMaster: CATransition = CATransition()
        transitionMaster.type = kCATransitionPush
        transitionMaster.subtype = kCATransitionFromRight
        masterVC!.view.layer.addAnimation(transitionMaster, forKey: "hideOrAppear")
        
        UIView.animateWithDuration(0.2) { 
            
            self.isMasterHidden = true
            let tabBarWidth: CGFloat = 70
            self.detailVC!.view.frame = CGRectMake(tabBarWidth, 0, self.view.bounds.size.width - tabBarWidth, self.view.bounds.size.height)
        }
    }
    
    func showMaster() -> Void {
        
        isMasterHidden = false
        self.view.layoutIfNeeded()
        
        let transitionMaster = CATransition()
        transitionMaster.type = kCATransitionPush
        transitionMaster.subtype = kCATransitionFromLeft
        transitionMaster.duration = 0.2
        self.masterVC!.view.layer.addAnimation(transitionMaster, forKey: "hideOrAppear")
    }
    
    //MARK: Autorotation
    override func shouldAutorotate() -> Bool {
        
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
        return UIInterfaceOrientationMask.All
    }
    
    //MARK: TabBarDelegate
    func tabBarAndSelectedViewController(tabBar: XKTabBar, vc: UIViewController) {
        
        if isMasterHidden {
            
            isMasterHidden = false
            self.view.setNeedsLayout()
        }
        
        masterVC!.viewController = vc
    }
}
