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
        
        // Configure the PageControl
        self.configurePageControl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func configurePageControl(){
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.orangeColor()
        self.pageControl.pageIndicatorTintColor = UIColor(red:1, green:1, blue: 1, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 222/255.0, green: 75/225.0, blue: 53/255.0, alpha: 0.75)
        self.view.addSubview(pageControl)

    }
    
    //-MARK: ScrollView
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if ( scrollView.contentOffset.x > 600){
            UIView.animateWithDuration(0.5, delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    self.startButton.frame.origin.y = 492
                    
                },
                completion: {finished in
                    
                }
            )
        }else{
            UIView.animateWithDuration(0.5, delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    self.startButton.frame.origin.y = 692
                },
                completion: {finished in
            
                }
            )
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}
