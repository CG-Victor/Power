//
//  LimitingBeliefs.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import UIKit
import Foundation
import Firebase



class LimitingBeliefsTextView: UIViewController, UITextViewDelegate {
    
    var journalEntry: JournalEntry?
    
    
    let textView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "1. I may not pass this Advanced Calculus class.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
//        attributedText.append(NSAttributedString(string: "1. False xyz", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
        
        textView.attributedText = attributedText
        
        
        textView.textColor = UIColor.lightGray
        textView.backgroundColor = UIColor.gloomyBackground
        textView.becomeFirstResponder()
        textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        return textView
        

    }()
    
    fileprivate let submitButton: UIButton = {
        let sb = UIButton(type: .system)
        sb.setTitle("Submit", for: .normal)
        sb.setTitleColor(.red, for: .normal)
        sb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        sb.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return sb
    }()
    
    @objc func handleSubmit() {
        
        guard let commentText = textView.text else { return }
        
        
        let values = ["text": commentText, "creationDate": Date().timeIntervalSince1970] as [String : Any]
        
        Database.database().reference().child("comments").updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if let err = err {
                print("Failed to save user info into db:", err)
                return
            }
            
            print("Successfully saved user info to db")
            
        })
        
    }
    
    let limitingBeliefLabel: UILabel = {
        let label = UILabel()
       

        
        let attributedText = NSMutableAttributedString(string: "Limiting Beliefs", attributes:
            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25),
            NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        
        label.attributedText = attributedText
        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 25)
        
        
        
        label.textColor = .white
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        Database.database().isPersistenceEnabled = true
        

        view.backgroundColor = UIColor.gloomyBackground
        
        let containerView = UIView()
        containerView.backgroundColor = .gloomyBackground
        
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        containerView.addSubview(limitingBeliefLabel)
        limitingBeliefLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)


        view.addSubview(textView)
        textView.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        textView.delegate = self
        
//        view.addSubview(submitButton)
//        submitButton.anchor(top: textView.topAnchor, left: nil, bottom: nil, right: textView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 50, height: 50)

        
        // let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
//        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
//        let statusBarColor = UIColor.white
//        statusBarView.backgroundColor = statusBarColor
//        view.addSubview(statusBarView)

        
        // Gesture
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeLeft.direction = .left
//        self.view.addGestureRecognizer(swipeLeft)
        
//        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
//        navigationItem.leftBarButtonItem = backButton
    }
    



//    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
//        if gesture.direction == UISwipeGestureRecognizerDirection.left {
//            _ = navigationController?.popViewController(animated: true)
//        }
//    }
    



    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        // Combine the textView text and the replacement text to create the updated text string
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)

        // If updated text view will be empty, add the placeholder and set the cursor to the beginning of the text view
        if updatedText.isEmpty {

            textView.text = "1."
            textView.textColor = UIColor.lightGray // font as you start typing

            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }

            // Else if the text view's placeholder is showing and the length of the replacement string is greater than 0, set the text color to black then set its text to the replacement string
        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.white
            textView.text = text
        }

            // For every other case, the text should change with the usual behavior...
        else {
            return true
        }

        // ...otherwise return false since the updates have already  been made
        return false
    }

    
    override func viewDidLayoutSubviews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        UIApplication.shared.isStatusBarHidden = true
    }
    
    


}

