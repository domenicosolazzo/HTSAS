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
        lessons.append(HTSASLesson(title: "How to Start a Startup", authors: "Sam Altman, Dustin Moskovitz", videoIdentifier:"CBYhVcO4WgI", transcripts:["bdsggssagasGSA", "fsaafsasas ffsaafs fafsafssafsfasfasfasaf"]))
        lessons.append(HTSASLesson(title: "Team and Execution", authors: "Sam Altman", videoIdentifier:"CVfnkM44Urs", transcripts:[]))
        lessons.append(HTSASLesson(title: "Before the Startup", authors: "Paul Graham", videoIdentifier:"ii1jcLg-eIQ", transcripts:[]))
        lessons.append(HTSASLesson(title: "Building Product, Talking Users and Growing", authors: "Adora Cheung", videoIdentifier:"yP176MBG9Tk", transcripts:[]))
        lessons.append(HTSASLesson(title: "Competition is for losers", authors: "Peter Thiel", videoIdentifier:"5_0dVHMpJlo", transcripts:[]))
        lessons.append(HTSASLesson(title: "Growth", authors: "Alex Schultz", videoIdentifier:"n_yHZ_vKjno", transcripts:[]))
        lessons.append(HTSASLesson(title: "How to Build Products Users Love", authors: "Kevin Hale", videoIdentifier:"sz_LgBAGYyo", transcripts:[]))
        lessons.append(HTSASLesson(title: "Doing Things That Don't Scale", authors: "Press", videoIdentifier:"oQOC-qy-GDY", transcripts:[]))
        lessons.append(HTSASLesson(title: "How To Raise Money", authors: "Marc Andreessen, Ron Conway, Parker Conrad", videoIdentifier:"uFX95HahaUs", transcripts:[]))
        lessons.append(HTSASLesson(title: "Culture", authors: "Brian Chesky, Alfred Lin", videoIdentifier: "RfWgVWGEuGE", transcripts:[]))
        lessons.append(HTSASLesson(title: "Hiring and Culture - Part 2", authors: "Patrik and John Collison, Ben Silbermann", videoIdentifier:"H8Dl8rZ6qwE", transcripts:[]))
        lessons.append(HTSASLesson(title: "Building for the Enterprise", authors: "Aaron Levie", videoIdentifier:"tFVDjrvQJdw", transcripts:[]))
        lessons.append(HTSASLesson(title: "How to be a Great Founder", authors: "Reid Hoffman", videoIdentifier:"dQ7ZvO5DpIw", transcripts:[]))
        lessons.append(HTSASLesson(title: "How to Operate", authors: "Keith Rabois", videoIdentifier:"6fQHLK1aIBs", transcripts:[]))
        lessons.append(HTSASLesson(title: "How to Manage", authors: "Ben Horowitz", videoIdentifier:"uVhTvQXfibU", transcripts:[]))
        lessons.append(HTSASLesson(title: "How to Run a User Interview", authors: "Emmett Shear", videoIdentifier:"qAws7eXItMk", transcripts:[]))
        lessons.append(HTSASLesson(title: "How to Design Hardware Products", authors: "Hosain Rahman", videoIdentifier:"F4K_qVlYQkg", transcripts:[]))
        lessons.append(HTSASLesson(title: "Legal and Accounting Basics for Startups", authors: "Kirsty Nathoo, Carolynn Levei", videoIdentifier:"EHzvmyMJEK4", transcripts:[]))
        lessons.append(HTSASLesson(title: "How to Talk Investors", authors: "Tyler Bosmeny", videoIdentifier:"SHAh6WKBgiE", transcripts:[]))
        lessons.append(HTSASLesson(title: "Later-Stage Advice", authors: "Sam Altman", videoIdentifier:"59ZQ-rf6iIc", transcripts:[]))
        
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
    
    //-MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLesson"{
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let object = lessons[indexPath.row] as HTSASLesson
                let controller = segue.destinationViewController as! LessonViewController
                controller.detailLessonItem = object
                controller.navigationItem.title = object.title
            }
            
        }
    }



}

