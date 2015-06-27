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
    private var lessons = [HTSASLesson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lessons.append(HTSASLesson(title: "How to Start a Startup", authors: "Sam Altman, Dustin Moskovitz"))
        lessons.append(HTSASLesson(title: "Team and Execution", authors: "Sam Altman"))
        lessons.append(HTSASLesson(title: "Before the Startup", authors: "Paul Graham"))
        lessons.append(HTSASLesson(title: "Building Product, Talking Users and Growing", authors: "Adora Cheung"))
        lessons.append(HTSASLesson(title: "Competition is for losers", authors: "Peter Thiel"))
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
        
        var data: HTSASLesson = lessons[indexPath.row]
        cell.textLabel!.text = data.title
        cell.detailTextLabel!.text = data.authors
        
        return cell
    }


}

