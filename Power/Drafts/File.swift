////
////  LimitingBeliefs.swift
////  Power
////
////  Created by Chris Gonzaga on 8/27/18.
////  Copyright © 2018 Chris Gonzaga. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//
//class LimitingBeliefsTextView: UIViewController, UITextViewDelegate {
//    
//    //    let textView: UITextView = {
//    //        let textView = UITextView()
//    //        textView.textColor = UIColor.black
//    //        textView.isEditable = true
//    //        textView.backgroundColor = UIColor.gray
//    //
//    //        return textView
//    //    }()
//    
//    //    fileprivate let placeholderLabel: UILabel = {
//    //        let label = UILabel()
//    //        label.text = "Enter Comment"
//    //        label.textColor = .red
//    //        return label
//    //    }()
//    //
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .white
//        
//        
//        let textView = UITextView()
//        textView.text = "Placeholder"
//        textView.textColor = UIColor.lightGray
//        
//        textView.becomeFirstResponder()
//        
//        textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//        textView.delegate = self
//        
//        //        view.backgroundColor = .gray
//        //
//        //        textView.isHidden = false
//        //
//        //        placeholderLabel.isHidden = false
//        //
//        //        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChange), name: .UITextViewTextDidChange, object: nil)
//        //
//        //
//        view.addSubview(textView)
//        textView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        
//        //        view.addSubview(placeholderLabel)
//        //        placeholderLabel.anchor(top: textView.topAnchor, left: textView.leftAnchor, bottom: textView.bottomAnchor, right: textView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        //
//        
//    }
//    
//    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        
//        // Combine the textView text and the replacement text to
//        // create the updated text string
//        let currentText:String = textView.text
//        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
//        
//        // If updated text view will be empty, add the placeholder
//        // and set the cursor to the beginning of the text view
//        if updatedText.isEmpty {
//            
//            textView.text = "Placeholder"
//            textView.textColor = UIColor.lightGray
//            
//            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//        }
//            
//            // Else if the text view's placeholder is showing and the
//            // length of the replacement string is greater than 0, set
//            // the text color to black then set its text to the
//            // replacement string
//        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
//            textView.textColor = UIColor.black
//            textView.text = text
//        }
//            
//            // For every other case, the text should change with the usual
//            // behavior...
//        else {
//            return true
//        }
//        
//        // ...otherwise return false since the updates have already
//        // been made
//        return false
//    }
//    
//    
//    
//    
//    //
//    //    @objc func handleTextChange() {
//    //        placeholderLabel.isHidden = !textView.text.isEmpty
//    //    }
//    //
//}
