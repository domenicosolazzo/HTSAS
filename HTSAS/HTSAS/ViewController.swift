//
//  ViewController.swift
//  HTSAS
//
//  Created by Domenico on 27/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var lessons = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lessons.append("Lesson 1")
        lessons.append("Lesson 2")
        println(lessons)
        
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-MARK: TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lessonCell", forIndexPath: indexPath) as! UITableViewCell
        
        var data: String = lessons[indexPath.row]
        println(data)
        cell.textLabel!.text = data
        
        return cell
    }


}

