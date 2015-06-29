//
//  LessonViewController.swift
//  HTSAS
//
//  Created by Domenico on 27/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit
import MediaPlayer
import XCDYouTubeKit

class LessonViewController: UIViewController, UITableViewDataSource {

    private var theTitle: String = "ciao"
    private var authors: String = "ciao"
    private var videoIdentifier: String = ""
    private var transcripts = [LessonTranscript]()
    
    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var lessonAuthors: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        self.lessonTitle.text = theTitle
        self.lessonAuthors.text = authors
    }
    
    var detailLessonItem: Lesson? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        
        
        // Update the user interface for the detail item.
        if let detail: Lesson = self.detailLessonItem {
            if self.lessonTitle == nil{
                self.lessonTitle = UILabel()
            }
            self.theTitle = detail.title!
            self.authors = detail.authors!
            self.transcripts = detail.transcripts!
            self.videoIdentifier = detail.youtubeID!
        }
    }
    
    @IBAction func playVideo(sender: AnyObject) {
        self.startPlayingVideo()
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
        
        //cell.textLabel!.text = transcripts[indexPath.row]
        return cell
    }
    
    
    //- MARK: Video player
    func startPlayingVideo(){
        var videoPlayerViewController: XCDYouTubeVideoPlayerViewController = XCDYouTubeVideoPlayerViewController(videoIdentifier:self.videoIdentifier)
        self.presentMoviePlayerViewControllerAnimated(videoPlayerViewController)
    }
}
