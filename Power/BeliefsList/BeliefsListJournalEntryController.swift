//
//  BeliefsListJournalEntry.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//


import UIKit
import Firebase



class BeliefsListJournalEntryController: UIPageViewController, UIPageViewControllerDataSource, LimitingBeliefsTextViewDelegate  {
   
    var journalEntry: JournalEntry?
    
    func didSave(topic: String, journalText: String) {
        print("Testing for delegation")
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = ["title": topic, "text": journalText, "creationDate": Date().timeIntervalSince1970, "uid": uid] as [String : Any]

        Database.database().reference().child("journalEntries").child(uid).childByAutoId().updateChildValues(values) { (err, ref) in
            
            if let err = err {
                print("Failed to save user info into db:", err)
                return
            }
            
            print("Successfully saved user info to db")
            
        }
    }
    
   

    
    lazy var viewControllerList: [UIViewController] = {
        
        let limitingBeliefsTextView = LimitingBeliefsTextView()
        
        let lBTextViewController = templateNavController(rootViewController: limitingBeliefsTextView)
        limitingBeliefsTextView.delegate = self
        
        let eBTextViewController = templateNavController(rootViewController: EmpoweringBeliefsTextView())
        
        
        return [lBTextViewController, eBTextViewController]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard viewControllerList.count > previousIndex else { return nil}
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else { return nil }
        
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        

   
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward
                , animated: true, completion: nil)
        }
        
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)

        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        UIApplication.shared.isStatusBarHidden = true

        
        
    }
    

}





