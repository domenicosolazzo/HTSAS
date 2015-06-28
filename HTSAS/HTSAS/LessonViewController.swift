//
//  LessonViewController.swift
//  HTSAS
//
//  Created by Domenico on 27/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class LessonViewController: UIViewController, UITableViewDataSource {

    private var theTitle: String = "ciao"
    private var authors: String = "ciao"
    private var videoUrl: String = ""
    private var transcripts = [String]()
    
    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var lessonAuthors: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        self.lessonTitle.text = theTitle
        self.lessonAuthors.text = authors
    }
    
    var detailLessonItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        
        
        // Update the user interface for the detail item.
        if let detail: HTSASLesson = self.detailLessonItem as? HTSASLesson {
            if self.lessonTitle == nil{
                self.lessonTitle = UILabel()
            }
            self.theTitle = detail.title
            self.authors = detail.authors
            self.transcripts = detail.transcripts
            self.videoUrl = detail.videoUrl
        }
    }
    
    @IBAction func playVideo(sender: AnyObject) {
    }
    
    //-MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transcripts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("transcriptCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = transcripts[indexPath.row]
        return cell
    }
}