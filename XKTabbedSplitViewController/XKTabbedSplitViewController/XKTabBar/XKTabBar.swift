//
//  XKTabBar.swift
//  XKTabbedSplitViewController
//
//  Created by DengYikai on 12/7/15.
//  Copyright © 2015 Safaride. All rights reserved.
//

import UIKit

protocol XKTabBarDelegate: NSObjectProtocol {
    func tabBarAndSelectedViewController(tabBar: XKTabBar, vc: UIViewController)
}

let iOS_7 = Double(UIDevice.currentDevice().systemVersion) >= 7.0

let tabBarWidth:Int = 96
let tabItemHeight:Int = 106

class XKTabBar: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var backgroundImage:UIImage?
    
    var _tabsButtons:Array<XKTabBarItem>?
    var tabsButtons:Array<XKTabBarItem>? {
        
        set {
            _tabsButtons = newValue
            tabsInit(_tabsButtons!)
        }
        
        get {
            
            if _tabsButtons == nil {
                
                return nil
            } else {
                return _tabsButtons
            }
        }
    }
    
    var delegate:XKTabBarDelegate?
    var selectedTabIndex:Int?
    
    private var tabsButtonsHeight:Int?
    private var selectedTab:NSIndexPath = NSIndexPath()
    
    private var tabsTable:UITableView?
    
    private var tabsButtonsFrame:CGRect?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.clipsToBounds = true
        self.view.backgroundColor = UIColor(red: randomColorValue(), green: randomColorValue(), blue: randomColorValue(), alpha: 1)
        
        tabsButtonsHeight = 0;
        tabsButtonsFrame = CGRect(x: 0, y: 0, width: CGFloat(tabBarWidth), height: CGFloat(tabsButtonsHeight!));
    }
    
    private func tabsInit(tabs:[XKTabBarItem]) {
        
//        let tmpItems = tabs
        
        let count = tabs.count
        
        for _ in 0 ..< count {
            
            tabsButtonsHeight! += tabItemHeight
            
        }
        
//        tabsButtons = tabs;
        
        tabsTable = UITableView(frame: tabsButtonsFrame!, style: UITableViewStyle.Plain)
        tabsTable!.scrollEnabled = true
        tabsTable!.dataSource = self
        tabsTable!.delegate = self
        
        tabsTable!.separatorStyle = UITableViewCellSeparatorStyle.None
        tabsTable!.backgroundColor = UIColor.clearColor()
        tabsTable!.tableFooterView = UIView()
        
        if (tabsButtons!.count > 0) {
            
            let firstTab = NSIndexPath(forRow: 0, inSection: 0)
            selectedTabIndex = firstTab.row
            tabsTable!.selectRowAtIndexPath(firstTab, animated: true, scrollPosition: UITableViewScrollPosition.None)
            tableView(tabsTable!, didSelectRowAtIndexPath: firstTab)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func randomColorValue() -> CGFloat {
        
        return CGFloat(Double(arc4random_uniform(255)) / 255)
    }
    
    //MARK: ViewController Lifecycle
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        self.view.frame = CGRectMake(0, 85, CGFloat(tabBarWidth), self.view.bounds.size.height)
        
        if tabsTable != nil {
            
            tabsTable!.frame = tabsButtonsFrame!
        }
        
        if Float(UIDevice.currentDevice().systemVersion) >= 8.0 {
            
//            tabsTable!.selectRowAtIndexPath(NSIndexPath(forRow: selectedTabIndex!, inSection: 0), animated: false, scrollPosition: UITableViewScrollPosition.None)
        }
    }
    
    //MARK: UITableViewDataSource/Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tabsButtons!.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return CGFloat(tabItemHeight)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:XKTabBarItemCell? = tableView.dequeueReusableCellWithIdentifier("tabbar") as? XKTabBarItemCell
        
        if (cell == nil) {
            cell = XKTabBarItemCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tabbar")
        }
        
        let tabItem:XKTabBarItem = tabsButtons![indexPath.row]
        cell!.viewController = tabItem.viewController;
        cell!.isFirstCell = indexPath.row == 0
        cell!.aSelectedColor = tabItem.viewController!.view.backgroundColor
        cell!.iconView!.image = tabItem.image
        cell!.aSelectedImage = tabItem.selectedImage
        cell!.aImage = tabItem.image
        cell!.titleLabel!.font = UIFont.systemFontOfSize(17)
        cell!.titleLabel!.text = tabItem.title
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (!(selectedTab.isEqual(indexPath))) {
            
            selectedTab = indexPath
            selectedTabIndex = indexPath.row
            let cell: XKTabBarItemCell = tableView.cellForRowAtIndexPath(indexPath) as! XKTabBarItemCell
            self.delegate!.tabBarAndSelectedViewController(self, vc: cell.viewController!)
        }
    }
    
    // MARK: Autototate iOS 6.0 +
    override func shouldAutorotate() -> Bool {
        
        return true;
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
        return UIInterfaceOrientationMask.All;
    }
}
