//
//  BeliefsListJournalEntry.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//


import UIKit

class Beliefs2ListJournalEntryController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerList: [UIViewController] = {
        //        let lBTextViewController = LimitingBeliefsTextView()
        
        let lBTextViewController = templateNavController(rootViewController: LimitingBeliefsTextView())
        
        let eBTextViewController = templateNavController(rootViewController: EmpoweringBeliefsTextView())
        return [lBTextViewController, eBTextViewController]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil } //arg above, get its index
        
        let previousIndex = vcIndex - 1 // this is before the current view controller
        
        
        guard previousIndex >= 0 else { return nil } // negative index nil shouldn't happen
        
        guard viewControllerList.count > previousIndex else { return nil}
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // now that comes after the view controller
        
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else { return nil }
        
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex] // chosing the next index
        
        // we got the func for the vc that comes before the vurrent vc, that vc comes afteer, and don't come out of bounds and run this
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward
                , animated: true, completion: nil)
        }
        
        
        // Gesture
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    fileprivate func templateNavController(rootViewController: UIViewController) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        return navController
    }
    
    
    override func viewDidLayoutSubviews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
    
    
}





