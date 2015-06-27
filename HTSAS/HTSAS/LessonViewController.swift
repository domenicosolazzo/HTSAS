//
//  LessonViewController.swift
//  HTSAS
//
//  Created by Domenico on 27/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class LessonViewController: UIViewController {

    private var theTitle: String = "ciao"
    private var authors: String = "ciao"
    
    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var lessonAuthors: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        }
    }
}
