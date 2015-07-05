 //
//  ViewController.swift
//  HTSAS
//
//  Created by Domenico on 27/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit
import JSONJoy

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var lessons: Lessons!
    override func viewDidLoad() {
        super.viewDidLoad()
        var appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        lessons = appDelegate!.lessons
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-MARK: TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lessonCell", forIndexPath: indexPath) as! UITableViewCell
        
        var data: Lesson = lessons[indexPath.row]!
        cell.textLabel!.text = data.title
        //cell.detailTextLabel!.text = data.authors
        
        return cell
    }
    
    //-MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLesson"{
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let object: Lesson = lessons[indexPath.row]!
                if let navigation = segue.destinationViewController as? UINavigationController{
                    if let controller = navigation.topViewController as? LessonController{
                        controller.detailLessonItem = object
                        controller.navigationItem.title = object.title
                    }
                }
                
            }
            
        }
    }



}

