////
////  BeliefsListJournalEntry.swift
////  Power
////
////  Created by Chris Gonzaga on 8/27/18.
////  Copyright © 2018 Chris Gonzaga. All rights reserved.
////
//
//
//import UIKit
//import Firebase
//
//
//
//class BeliefsListJournalEntryController: UIPageViewController, UIPageViewControllerDataSource, LimitingBeliefsTextViewDelegate  {
//    
//    var journalEntry: JournalEntry?
//    
//    func didSubmit(topic: String, journalText: String) {
//        print("Testing for delegation")
//        
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        
//        // make properties, aka, Dictionary, same property name as your Struct's properties.
//        //        let journalEntryId = self.journalEntry?.id ?? ""
//        let values = ["title": topic, "text": journalText, "creationDate": Date().timeIntervalSince1970, "uid": uid] as [String : Any]
//        
//        
//        Database.database().reference().child("journalEntries").child(uid).childByAutoId().updateChildValues(values) { (err, ref) in
//            
//            if let err = err {
//                print("Failed to save user info into db:", err)
//                return
//            }
//            
//            print("Successfully saved user info to db")
//            
//        }
//    }
//    
//    
//    
//    
//    
//    //    func didSubmit(for commentText: String) {
//    //        print("Trying to insert comment into Firebase")
//    //
//    //        let limitingBeliefsTextView = LimitingBeliefsTextView()
//    //        limitingBeliefsTextView.delegate = self
//    //
//    //        print(commentText)
//    //
//    //        let values = ["text": commentText, "creationDate": Date().timeIntervalSince1970] as [String : Any]
//    //
//    //
//    //        Database.database().reference().child("comments").updateChildValues(values) { (err, ref) in
//    //
//    //            if let err = err {
//    //                print("Failed to insert comment:", err)
//    //                return
//    //            }
//    //
//    //            print("Successflly saved.")
//    //
//    //        }
//    //
//    //
//    //
//    //        //        Database.database().reference().child("comments").updateChildValues(values, withCompletionBlock: { (err, ref) in
//    //        //
//    //        //            if let err = err {
//    //        //                print("Failed to save user info into db:", err)
//    //        //                return
//    //        //            }
//    //        //
//    //        //            print("Successfully saved user info to db")
//    //        //
//    //        //        })
//    //    }
//    //
//    
//    
//    
//    lazy var viewControllerList: [UIViewController] = {
//        
//        let limitingBeliefsTextView = LimitingBeliefsTextView()
//        
//        let lBTextViewController = templateNavController(rootViewController: limitingBeliefsTextView)
//        limitingBeliefsTextView.delegate = self
//        
//        let eBTextViewController = templateNavController(rootViewController: EmpoweringBeliefsTextView())
//        
//        
//        return [lBTextViewController, eBTextViewController]
//    }()
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil } //arg above, get its index
//        
//        let previousIndex = vcIndex - 1 // this is before the current view controller
//        
//        
//        guard previousIndex >= 0 else { return nil } // negative index nil shouldn't happen
//        
//        guard viewControllerList.count > previousIndex else { return nil}
//        
//        return viewControllerList[previousIndex]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        // now that comes after the view controller
//        
//        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
//        
//        let nextIndex = vcIndex + 1
//        
//        guard viewControllerList.count != nextIndex else { return nil }
//        
//        guard viewControllerList.count > nextIndex else { return nil }
//        
//        return viewControllerList[nextIndex] // chosing the next index
//        
//        // we got the func for the vc that comes before the vurrent vc, that vc comes afteer, and don't come out of bounds and run this
//    }
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.dataSource = self
//        
//        
//        
//        if let firstViewController = viewControllerList.first {
//            self.setViewControllers([firstViewController], direction: .forward
//                , animated: true, completion: nil)
//        }
//        
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeRight.direction = .right
//        self.view.addGestureRecognizer(swipeRight)
//        
//        
//        // NAVIGATION SAVE STYLE
//        //        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
//        //
//        //
//        
//    }
//    
//    //    @objc func save() {
//    //        print("THIS IS A SAVE")
//    //
//    ////        guard let commentText = textView.text else { return }
//    ////
//    ////
//    ////        let values = ["text": commentText, "creationDate": Date().timeIntervalSince1970] as [String : Any]
//    ////
//    ////        Database.database().reference().child("comments").updateChildValues(values, withCompletionBlock: { (err, ref) in
//    ////
//    ////            if let err = err {
//    ////                print("Failed to save user info into db:", err)
//    ////                return
//    ////            }
//    ////
//    ////            print("Successfully saved user info to db")
//    ////
//    ////        })
//    ////
//    //    }
//    
//    
//    
//    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
//        if gesture.direction == UISwipeGestureRecognizerDirection.right {
//            _ = navigationController?.popViewController(animated: true)
//            
//        }
//    }
//    
//    
//    fileprivate func templateNavController(rootViewController: UIViewController) -> UINavigationController {
//        
//        let viewController = rootViewController
//        let navController = UINavigationController(rootViewController: viewController)
//        return navController
//    }
//    
//    
//    override func viewDidLayoutSubviews() {
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        UIApplication.shared.isStatusBarHidden = true
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: false)
//        
//        UIApplication.shared.isStatusBarHidden = true
//        
//        
//        
//    }
//    
//    
//}
//
//
//
//
//
