//
//  FavoriteTableViewController.swift
//  HTSAS
//
//  Created by Domenico on 21/07/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit
import CoreData

class FavoriteTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        self.title = "Favorites"
        
        var fetchRequest = NSFetchRequest(entityName: "Favorite")
        
    }
}
