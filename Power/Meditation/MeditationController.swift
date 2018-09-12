//
//  ViewController.swift
//  Power
//
//  Created by Chris Gonzaga on 8/22/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import Firebase
import UIKit
import AVFoundation
import AVKit

class MeditationController: UIViewController, UIGestureRecognizerDelegate {
    
    
    
    let backgroundView: UIView = {
        let view = UIView()
        return view
    }()
   
    
    let breatheInLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "BREATHE IN...", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 36),
            NSAttributedStringKey.foregroundColor: UIColor.tealColor]
            )
        label.attributedText = attributedText
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 8
        label.layer.backgroundColor = UIColor.white.withAlphaComponent(0.2).cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    let breatheOutLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "BREATHE OUT...", attributes:
            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 36),
            NSAttributedStringKey.foregroundColor: UIColor.logoYellow]
        )
        label.attributedText = attributedText
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 8
        label.layer.backgroundColor = UIColor.white.withAlphaComponent(0.2).cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()

    override func viewDidLayoutSubviews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isStatusBarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let labelContainer = UILabel()
        labelContainer.fadeViewInThenOut(view1: breatheInLabel, view2: breatheOutLabel, delay: 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.title = "Hello"
        
        try? VideoBackground.shared.play(view: view, videoName: "meditationVideo3", videoType: "mov")
        

        view.backgroundColor = UIColor.tealColor


        view.addSubview(breatheInLabel)
        breatheInLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 40, paddingBottom: 2, paddingRight: 40, width: 180, height: 0)
        breatheInLabel.center(x: view.centerXAnchor, y: view.centerYAnchor)

        view.addSubview(breatheOutLabel)
        breatheOutLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 40, paddingBottom: 2, paddingRight: 40, width: 180, height: 0)
        breatheOutLabel.center(x: view.centerXAnchor, y: view.centerYAnchor)
        
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchHandled))
        view.addGestureRecognizer(tap)
    }
    
    var isTabBarHidden = false
    
    @objc func touchHandled() {
        
        tabBarController?.hideTabBarAnimated(hide: !isTabBarHidden)
        isTabBarHidden = !isTabBarHidden
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
  
    
   
}









