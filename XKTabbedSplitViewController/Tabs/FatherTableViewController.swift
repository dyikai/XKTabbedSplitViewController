//
//  FatherTableViewController.swift
//  XKTabbedSplitViewController
//
//  Created by DengYikai on 3/28/16.
//  Copyright © 2016 Safaride. All rights reserved.
//

import UIKit

class FatherTableViewController: UITableViewController {

    override func viewDidLoad() {
        
        let red: CGFloat = CGFloat(Double(arc4random_uniform(255)) / 255.0)
        let green: CGFloat = CGFloat(Double(arc4random_uniform(255)) / 255.0)
        let blue: CGFloat = CGFloat(Double(arc4random_uniform(255)) / 255.0)
        
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        self.tableView.scrollEnabled = false
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
}
