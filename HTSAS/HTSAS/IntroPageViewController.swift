
//
//  IntroPageViewController.swift
//  HTSAS
//
//  Created by Domenico on 27/07/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class IntroPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //- MARK: UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    
}
