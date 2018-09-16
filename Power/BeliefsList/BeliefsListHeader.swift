//
//  BeliefsListHeader.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import UIKit

protocol HeaderDelegate {
    func headerTapped()
}

class BeliefsListHeader: UICollectionViewCell {
    
    var delegate: HeaderDelegate?
    
//    let containerView: UIView = {
//        let container = UIView()
//        container.backgroundColor = .green
//        return container
//    }()
//
//    containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    
    
    fileprivate let submitButton: UIButton = {
        let sb = UIButton(type: .system)
        sb.setTitle("Submit", for: .normal)
        sb.setTitleColor(.red, for: .normal)
        sb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        sb.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return sb
    }()
    
    @objc func handleSubmit() {
        print("testing")
    }
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Journal Entries: Your Thoughts Are Your Reality", attributes:
            [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25),
             NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        attributedText.append(NSMutableAttributedString(string: "\n", attributes: nil))
        
        attributedText.append(NSMutableAttributedString(string: "\n", attributes: nil))
        
        attributedText.append(NSMutableAttributedString(string: "The best part: You get to CHOOSE them.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)]))
        
        
        // "The best part is - You get to choose them.
        label.attributedText = attributedText
        
        label.textAlignment = .center

        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        
        
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        backgroundColor = .white
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
