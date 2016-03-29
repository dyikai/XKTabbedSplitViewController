//
//  AppDelegate.swift
//  XKTabbedSplitViewController
//
//  Created by DengYikai on 11/14/15.
//  Copyright © 2015 Safaride. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let vc: ViewController? = ViewController()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = createVC()
        window!.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }
    
    func createVC() -> ViewController {
    
        let tb1 = XKTabBarItem(vc: TabbarVC1(), image: nil, selectedImage: nil, title: "tb1")
        let tb2 = XKTabBarItem(vc: TabBarVC2(), image: nil, selectedImage: nil, title: "tb2")
        let tb3 = XKTabBarItem(vc: TabBarVC3(), image: nil, selectedImage: nil, title: "tb3")
        let tb4 = XKTabBarItem(vc: TabBarVC4(), image: nil, selectedImage: nil, title: "tb4")
        
        vc!.tabsViewControllers = [tb1, tb2, tb3, tb4]
        
        return vc!
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

