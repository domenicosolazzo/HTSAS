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

class LessonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        self.configureTableView()
        self.tableView.dataSource = self
        
        self.lessonTitle.text = theTitle
        self.lessonAuthors.text = authors
    }
    
    
    var detailLessonItem: Lesson? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
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
            println(self.transcripts)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("transcriptCell", forIndexPath: indexPath) as! TranscriptCell
        
        var data: LessonTranscript = self.transcripts[indexPath.row]
        cell.captionLabel.text = data.caption
        cell.subtitleLabel.text = data.author
        return cell
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if isLandscapeOrientation() {
            return 120.0
        } else {
            return 155.0
        }
    }
    
    func isLandscapeOrientation() -> Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
    }
    
    
    //- MARK: Video player
    func startPlayingVideo(){
        var videoPlayerViewController: XCDYouTubeVideoPlayerViewController = XCDYouTubeVideoPlayerViewController(videoIdentifier:self.videoIdentifier)
        self.presentMoviePlayerViewControllerAnimated(videoPlayerViewController)
    }
}
