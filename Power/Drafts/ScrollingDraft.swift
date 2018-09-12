////
////  ScrollingDraft.swift
////  Power
////
////  Created by Chris Gonzaga on 9/11/18.
////  Copyright © 2018 Chris Gonzaga. All rights reserved.
////
//
//import Foundation
//import UIKit
//

// *** IT WAS BEST THAT I SCALE THE IMAGE OUTSIDE SWIFT TO FIT PROPERLY, MAKING IT SCROLL UP AND DOWN ONLY*

//lazy var scrollView: UIScrollView = {
//    let view = UIScrollView()
//    view.translatesAutoresizingMaskIntoConstraints = false
//    view.contentSize.height = 100
//    view.clipsToBounds = true
//    view.bounces = true
//    
//    
//    return view
//}()
//
//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    
//    
//    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//    
//    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    
//    
//    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//    backgroundImage.image = UIImage(named: "logInTest2")
//    backgroundImage.clipsToBounds = true
//    backgroundImage.contentMode = UIViewContentMode.scaleAspectFit
//    //        view.insertSubview(backgroundImage, at: 0)
//    
//    view.addSubview(scrollView)
//    scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//    
//    scrollView.addSubview(backgroundImage)
////        backgroundImage.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
////
////        backgroundImage.center(x: scrollView.centerXAnchor, y: scrollView.centerYAnchor)
