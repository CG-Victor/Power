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
//import Firebase
//
//// WAS HERE
//protocol LimitingBeliefsTextViewDelegate {
//    func didSubmit(for commentText: String)
//}
//
//// this wwll have a delegate, that will send a message to Entry Controller that a cell has been saved.
//// (look at CommentINputAccesoryView)
//
//class LimitingBeliefsTextView: UIViewController, UITextViewDelegate {
//    
//    var delegate: LimitingBeliefsTextViewDelegate?
//    
//    //    var journalEntry: JournalEntry?
//    
//    fileprivate let textView: UITextView = {
//        let textView = UITextView()
//        
//        let attributedText = NSMutableAttributedString(string: "1. I may not pass this Advanced Calculus class.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
//        
//        //        attributedText.append(NSAttributedString(string: "1. False xyz", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
//        
//        textView.attributedText = attributedText
//        
//        
//        textView.textColor = UIColor.lightGray
//        textView.backgroundColor = UIColor.gloomyBackground
//        textView.becomeFirstResponder()
//        textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//        return textView
//        
//        
//    }()
//    
//    fileprivate let submitButton: UIButton = {
//        let sb = UIButton(type: .system)
//        sb.setTitle("Submit", for: .normal)
//        sb.setTitleColor(.red, for: .normal)
//        sb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        sb.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
//        return sb
//    }()
//    
//    @objc func handleSubmit() {
//        print("testing save")
//        
//        
//        guard let commentText = textView.text else { return }
//        
//        
//        let values = ["text": commentText, "creationDate": Date().timeIntervalSince1970] as [String : Any]
//        
//        Database.database().reference().child("comments").updateChildValues(values, withCompletionBlock: { (err, ref) in
//            
//            if let err = err {
//                print("Failed to save user info into db:", err)
//                return
//            }
//            
//            print("Successfully saved user info to db")
//            
//        })
//        
//    }
//    
//    
//    
//    let nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Topic: "
//        //enable autolayout
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter topic here"
//        textField.tintColor = .gray
//        textField.textColor = .white
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    
//    
//    fileprivate let limitingBeliefLabel: UILabel = {
//        let label = UILabel()
//        
//        
//        
//        let attributedText = NSMutableAttributedString(string: "Limiting Beliefs", attributes:
//            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15),
//             NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
//        
//        
//        label.attributedText = attributedText
//        label.textAlignment = .center
//        //        label.font = UIFont.systemFont(ofSize: 25)
//        
//        
//        
//        label.textColor = .white
//        return label
//    }()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//        //        Database.database().isPersistenceEnabled = true
//        //
//        
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        
//        view.backgroundColor = UIColor.gloomyBackground
//        
//        let containerView = UIView()
//        containerView.backgroundColor = .gloomyBackground
//        
//        view.addSubview(containerView)
//        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
//        
//        
//        //        containerView.addSubview(nameLabel)
//        //        nameLabel.anchor(top: nameTextField.topAnchor, left: nameTextField.leftAnchor, bottom: nameTextField.bottomAnchor, right: nameTextField.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
//        //        nameLabel.center(x: containerView.centerXAnchor, y: nil)
//        
//        
//        
//        containerView.addSubview(nameTextField)
//        nameTextField.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        nameTextField.center(x: containerView.centerXAnchor, y: nil)
//        
//        //        containerView.addSubview(nameTextField)
//        //        nameTextField.anchor(top: nameLabel.topAnchor, left: nameLabel.rightAnchor, bottom: nameLabel.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        
//        containerView.addSubview(limitingBeliefLabel)
//        limitingBeliefLabel.anchor(top: nil, left: nil, bottom: containerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        limitingBeliefLabel.center(x: containerView.centerXAnchor, y: nil)
//        
//        
//        view.addSubview(textView)
//        textView.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        textView.delegate = self // told ya NOT TO REMOVE THIS!!
//        
//        
//        //        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
//        //        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        //        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
//        //        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
//        
//        
//        
//        
//        //        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
//        
//        
//        //        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
//        
//        
//        // manually adding a button instead of using a navigation
//        // overall, the Controller controls the navigation.
//        
//        
//        view.addSubview(submitButton)
//        submitButton.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
//        
//        //        view.addSubview(nameLabel)
//        //        nameLabel.topAnchor.constraint(equalTo: companyImageView.bottomAnchor).isActive = true
//        //        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//        //        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        //        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    
//    //    @objc func save() {
//    //        print("saving")
//    //        guard let commentText = textView.text else { return }
//    //
//    //        delegate?.didSubmit(for: commentText)
//    //
//    //    }
//    
//    
//    //    @objc func addJournalEntry() {
//    //        delegate?.didSubmit()
//    //
//    ////        delegate?.didSubmit(for: commentText)
//    //    }
//    
//    
//    
//    
//    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        
//        // Combine the textView text and the replacement text to create the updated text string
//        let currentText:String = textView.text
//        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
//        
//        // If updated text view will be empty, add the placeholder and set the cursor to the beginning of the text view
//        if updatedText.isEmpty {
//            
//            textView.text = "1."
//            textView.textColor = UIColor.lightGray // font as you start typing
//            
//            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//        }
//            
//            // Else if the text view's placeholder is showing and the length of the replacement string is greater than 0, set the text color to black then set its text to the replacement string
//        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
//            textView.textColor = UIColor.white
//            textView.text = text
//        }
//            
//            // For every other case, the text should change with the usual behavior...
//        else {
//            return true
//        }
//        
//        // ...otherwise return false since the updates have already  been made
//        return false
//    }
//    
//    
//    // * MARK NAVIGATION HIDE
//    
//    override func viewDidLayoutSubviews() {
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        UIApplication.shared.isStatusBarHidden = true
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
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        UIApplication.shared.isStatusBarHidden = false
//    }
//    
//    
//}
//
