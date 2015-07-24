//
//  IntroViewController.swift
//  HTSAS
//
//  Created by Domenico on 24/07/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var theScrollView: UIScrollView!
    @IBOutlet weak var startButton: UIButton!
    var pageControl = UIPageControl(frame: CGRectMake(141, 455, 39, 37))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theScrollView.contentSize = CGSizeMake(960, 568)
        theScrollView.showsHorizontalScrollIndicator = false
        theScrollView.pagingEnabled = true
        theScrollView.delegate = self
    }
}
