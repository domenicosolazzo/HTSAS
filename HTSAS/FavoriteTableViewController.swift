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
    //- MARK: Private variables
    var frc: NSFetchedResultsController!
    
    //- MARK: Computed variables
    var managedObjectContext: NSManagedObjectContext{
        return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    }
    
    //- MARK: Initialization
    override func viewDidLoad() {
        self.title = "Favorites"
        
        // Fetch request
        var fetchRequest = NSFetchRequest(entityName: "Favorite")
        
        // Sort descriptor
        var quoteDescriptor = NSSortDescriptor(key: "quote", ascending: true)
        
        fetchRequest.sortDescriptors = [quoteDescriptor]
        
        
    }
}
