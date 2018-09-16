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

protocol LimitingBeliefsTextViewDelegate {
    func didSave(topic: String, journalText: String)
}


class LimitingBeliefsTextView: UIViewController, UITextViewDelegate {
    

    
    var journalEntry: JournalEntry? {
        didSet {
            topicTextField.text = journalEntry?.title
        }
    }
    
    
    
    fileprivate let journalTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "1. This advanced Computer Science class is too difficult", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
        textView.attributedText = attributedText
        textView.textColor = UIColor.lightGray
        textView.backgroundColor = UIColor.gloomyBackground
        textView.becomeFirstResponder()
        textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        return textView
        

    }()
    
    lazy var saveButton: UIButton = {
        let sb = UIButton(type: .system)
        sb.setTitle("Save", for: .normal)
        sb.setTitleColor(.red, for: .normal)
        sb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        sb.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return sb
    }()
    
    
    var delegate: LimitingBeliefsTextViewDelegate?
    
    @objc func handleSave() {
        print("testing save")
        

        guard let topic = topicTextField.text else { return }
        guard let journalText = journalTextView.text else { return }
        
        self.delegate?.didSave(topic: topic, journalText: journalText)


    }
    
    

    
    let topicTextField: UITextField = {
        let textField = UITextField()

        textField.tintColor = .white
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.attributedPlaceholder = NSAttributedString(string: "Insert topic here", attributes:
                                        [NSAttributedStringKey.foregroundColor: UIColor.gray])
        
        return textField
    }()
    

 


    fileprivate let limitingBeliefLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Limiting Beliefs", attributes:
            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15),
            NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        
        label.attributedText = attributedText
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        


        navigationController?.setNavigationBarHidden(true, animated: false)
        
            
        view.backgroundColor = UIColor.gloomyBackground
        
        let containerView = UIView()
        containerView.backgroundColor = .gloomyBackground
        
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        
        
        
        containerView.addSubview(topicTextField)
        topicTextField.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        topicTextField.center(x: containerView.centerXAnchor, y: nil)
        

        containerView.addSubview(limitingBeliefLabel)
        limitingBeliefLabel.anchor(top: nil, left: nil, bottom: containerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        limitingBeliefLabel.center(x: containerView.centerXAnchor, y: nil)
        
        
        view.addSubview(journalTextView)
        journalTextView.anchor(top: containerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        journalTextView.delegate = self // told ya NOT TO REMOVE THIS!!
        
        
        
        
        view.addSubview(saveButton)
        saveButton.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
    }


    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {


        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)

        if updatedText.isEmpty {

            textView.text = "1."
            textView.textColor = UIColor.lightGray

            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            

        }


        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.white
            textView.text = text
        }

        else {
            return true
        }

        return false
    }

    
    // * MARK NAVIGATION HIDE
    
    override func viewDidLayoutSubviews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.isStatusBarHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)

        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.isStatusBarHidden = false
    }

}

