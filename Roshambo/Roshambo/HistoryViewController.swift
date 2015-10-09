//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Rachel Schifano on 8/4/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class HistoryViewController: UIViewController, UITableViewDataSource {
    
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return self.history[indexPath.row]
    }
}