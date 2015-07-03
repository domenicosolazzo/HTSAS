//
//  LessonController.swift
//  HTSAS
//
//  Created by Domenico on 01/07/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit
import MediaPlayer
import XCDYouTubeKit
import Social

class LessonController: UITableViewController {

    private var videoIdentifier: String = ""
    private var transcripts = [LessonTranscript]()
    
   
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
    }
    @IBAction func playVideo(sender: AnyObject) {
        self.startPlayingVideo()
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
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
            
            self.transcripts = detail.transcripts!
            println(self.transcripts)
            self.videoIdentifier = detail.youtubeID!
        }
    }
    
    
    
    //-MARK: UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transcripts.count
    }
    
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("transcriptCell", forIndexPath: indexPath) as! TranscriptCell
        
        var data: LessonTranscript = self.transcripts[indexPath.row]
        
        let font = UIFont(name: "HelveticaNeue", size: 12.0)
        cell.captionLabel.font = font
        cell.captionLabel.sizeToFit()
        cell.captionLabel.numberOfLines = 0
        cell.captionLabel.text = data.caption
        cell.subtitleLabel.text = data.author
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var data: LessonTranscript = self.transcripts[indexPath.row]

        let delete = UITableViewRowAction(style: .Normal, title: "Share") { action, index in
            println("share")
            tableView.setEditing(false, animated: true)
            
            let serviceType = SLServiceTypeTwitter
            if SLComposeViewController.isAvailableForServiceType(serviceType){
                let controller = SLComposeViewController(forServiceType: serviceType)
                // Set the initial text
                controller.setInitialText("\(data.caption!) by @startuppio #startups #startup")
                // Completion Handler
                controller.completionHandler = {(result: SLComposeViewControllerResult) in
                    println("Completed")
                    println("Result: \(result)")
                }
                
                self.presentViewController(controller, animated: true, completion: nil)
            }else{
                println("Twitter service is not available")
            }

        }
        
        delete.backgroundColor = UIColor.grayColor()
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        var vibracy = UIVibrancyEffect(forBlurEffect: effect)
        delete.backgroundEffect = effect
        let done = UITableViewRowAction(style: .Normal, title: "Save") {action, index in
            println("save")
            action.backgroundColor = UIColor(red: 2.0/255.0, green: 192.0/255.0, blue: 99.0/255.0, alpha: 1.0)

            tableView.setEditing(false, animated: true)
            
            // Saving
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(data as? AnyObject, forKey: data.caption!)
        }
        
        done.backgroundColor = UIColor(red: 253.0/255.0, green: 92.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        return [delete, done]
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        var height:CGFloat = self.calculateHeightForString(self.transcripts[indexPath.row].caption!)
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
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
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
