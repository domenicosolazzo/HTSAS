//
//  LessonViewController.swift
//  HTSAS
//
//  Created by Domenico on 27/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit
import MediaPlayer

class LessonViewController: UIViewController, UITableViewDataSource {

    private var theTitle: String = "ciao"
    private var authors: String = "ciao"
    private var videoUrl: String = ""
    private var transcripts = [String]()
    private var moviePlayer: MPMoviePlayerController?
    
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
        
        cell.textLabel!.text = transcripts[indexPath.row]
        return cell
    }
    
    
    //- MARK: Video player
    func stopPlayingVideo() {
        
        if let player = moviePlayer{
            NSNotificationCenter.defaultCenter().removeObserver(self)
            player.stop()
            player.view.removeFromSuperview()
        }
        
    }
    
    func videoHasFinishedPlaying(notification: NSNotification){
        
        println("Video finished playing")
        
        /* Find out what the reason was for the player to stop */
        let reason =
        notification.userInfo![MPMoviePlayerPlaybackDidFinishReasonUserInfoKey]
            as! NSNumber?
        
        if let theReason = reason{
            
            let reasonValue = MPMovieFinishReason(rawValue: theReason.integerValue)
            
            switch reasonValue!{
            case .PlaybackEnded:
                /* The movie ended normally */
                println("Playback Ended")
            case .PlaybackError:
                /* An error happened and the movie ended */
                println("Error happened")
            case .UserExited:
                /* The user exited the player */
                println("User exited")
            default:
                println("Another event happened")
            }
            
            println("Finish Reason = \(theReason)")
            stopPlayingVideo()
        }
        
    }
    
    func videoFilePath() -> NSURL?{
        println(self.videoUrl)
        let url = NSURL(string: self.videoUrl)
        return url
    }
    
    func videoStarted(notification:NSNotification){
        println("Started...")
        println("User info: \(notification.userInfo!)")
    }
    
    func startPlayingVideo(){
        
        let url = self.videoFilePath()
        
        /* If we have already created a movie player before,
        let's try to stop it */
        if let player = moviePlayer{
            stopPlayingVideo()
        }
        
        /* Now create a new movie player using the URL */
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
        if let player = moviePlayer{
            
            /* Listen for the notification that the movie player sends us
            whenever it finishes playing */
            NSNotificationCenter.defaultCenter().addObserver(self,
                selector: "videoHasFinishedPlaying:",
                name: MPMoviePlayerPlaybackDidFinishNotification,
                object: nil)
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "videoStarted:", name: MPMoviePlayerNowPlayingMovieDidChangeNotification, object: nil)
            
            println("Successfully instantiated the movie player")
            
            /* Scale the movie player to fit the aspect ratio */
            player.scalingMode = .AspectFit
            
            view.addSubview(player.view)
            
            player.setFullscreen(true, animated: true)
            
            /* Let's start playing the video in full screen mode */
            player.prepareToPlay()
            
            player.play()
            
        } else {
            println("Failed to instantiate the movie player")
        }
        
    }
}
