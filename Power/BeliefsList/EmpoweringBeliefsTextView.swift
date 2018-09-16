//
//  LimitingBeliefs.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import UIKit
import Foundation

protocol EmpoweringBeliefsTextViewDelegate {
    func didSubmit(for commentText: String)
}

class EmpoweringBeliefsTextView: UIViewController, UITextViewDelegate {
    
    let textView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "1. As long as I remain focus and dicipline, look for help from my tutor, I can pass this class.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
//        attributedText.append(NSAttributedString(string: "1. Your Empowering ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]))
        
        textView.attributedText = attributedText
        
        
        textView.textColor = UIColor.lightRed
        textView.backgroundColor = UIColor.yellow
        textView.becomeFirstResponder()
        textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        return textView
        
        
    }()
    
    let empoweringBeliefLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Empowering Beliefs", attributes:
            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25),
             NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        
        label.attributedText = attributedText
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = UIColor.yellow
        
        let containerView = UIView()
        containerView.backgroundColor = .yellow
        
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        containerView.addSubview(empoweringBeliefLabel)
        empoweringBeliefLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        view.addSubview(textView)
        textView.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        textView.delegate = self
        
        
        
        // let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor.white
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        
        
//        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
        
        
    }
    
//    @objc func save() {
//        print("saving")
//    }
//    
//    
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to create the updated text string
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightRed
            
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }
            
            // Else if the text view's placeholder is showing and the length of the replacement string is greater than 0, set the text color to black then set its text to the replacement string
        else if textView.textColor == UIColor.lightRed && !text.isEmpty {
            textView.textColor = UIColor.red
            textView.text = text
        }
            
            // For every other case, the text should change with the usual behavior...
        else {
            return true
        }
        
        // ...otherwise return false since the updates have already  been made
        return false
    }
    
    
    
    // NAVIGATION HIDDEN
//    override func viewDidLayoutSubviews() {
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: false)
//
//    }
//
    
}

