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
//    let textView: UITextView = {
//        let textView = UITextView()
//        textView.textColor = UIColor.black
//        textView.isEditable = true
//        textView.backgroundColor = UIColor.gray
//
//        return textView
//    }()
//
//    fileprivate let placeholderLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Enter Comment"
//        label.textColor = .red
//        return label
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //        textView.delegate = self
//        //        view.backgroundColor = .gray
//        //
//        //        textView.isHidden = false
//        //
//        placeholderLabel.isHidden = false
//
//        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChange), name: .UITextViewTextDidChange, object: nil)
//
//
//        view.addSubview(textView)
//        textView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//
//        view.addSubview(placeholderLabel)
//        placeholderLabel.anchor(top: textView.topAnchor, left: textView.leftAnchor, bottom: textView.bottomAnchor, right: textView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//
//
//    }
//
//
//
//
//    @objc func handleTextChange() {
//        placeholderLabel.isHidden = !textView.text.isEmpty
//    }
//
//}
