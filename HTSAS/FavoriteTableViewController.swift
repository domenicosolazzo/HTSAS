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
        
        self.frc = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        self.frc.delegate = self
        
        var fetchError: NSError?
        if self.frc.performFetch(&fetchError){
            println("Retrieved...")
        }else{
            if let error = fetchError{
                println("Error: \(error)")
            }
        }
        
    }
    
    //- MARK: NSFetchedResultsControllerDelegate
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        if type == NSFetchedResultsChangeType.Insert{
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
        if type == NSFetchedResultsChangeType.Delete{
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    //- MARK: TableView
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = frc.sections![section] as! NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteCell", forIndexPath: indexPath) as! UITableViewCell
        
        let favorite = frc.objectAtIndexPath(indexPath) as! Favorite
        
        let font = UIFont(name: "HelveticaNeue", size: 12.0)
        cell.textLabel!.font = font
        cell.textLabel!.sizeToFit()
        cell.textLabel!.numberOfLines = 0;
        cell.textLabel!.text = favorite.quote
        
        
        return cell 

    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let favorite = frc.objectAtIndexPath(indexPath) as! Favorite
        var height:CGFloat = self.calculateHeightForString(favorite.quote)
        return height + 70.0
    }
    
    func calculateHeightForString(inString:String) -> CGFloat
    {
        var messageString = inString
        let font: UIFont? = UIFont(name: "HelveticaNeue", size: 12.0)
        var attributes = [UIFont(): font!]
        var attrString:NSAttributedString? = NSAttributedString(string: messageString, attributes: attributes)
        var rect:CGRect = attrString!.boundingRectWithSize(CGSizeMake(300.0,CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context:nil )
        var requredSize:CGRect = rect
        return requredSize.height  //to include button's in your tableview
        
    }
}
