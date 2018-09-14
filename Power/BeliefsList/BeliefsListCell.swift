//
//  BeliefsListCell.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import UIKit

class BeliefsListCell: UICollectionViewCell {
    
    var journalEntry: JournalEntry? {
        didSet {
            
//            titleLabel.text = journalEntry?.title
        
            
        }
    }
//
    // needs to be didSet soon
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dissecting Limited Beliefs Journal Entry"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "1/1/2017"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightGreen.withAlphaComponent(1)
        
        setupUserStackview()
        
//        addSubview(titleLabel)
//        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//
//        addSubview(dateLabel)
//        dateLabel.anchor(top: titleLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    
    fileprivate func setupUserStackview() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, dateLabel])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 50, height: 50)
    }
    
    fileprivate func setupAttributedTitleWithDate() {
        
        guard let journalEntry = self.journalEntry else { return }
        
        
        let attributedText = NSMutableAttributedString(string: "\(journalEntry.title)", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
        
        let timeAgoDisplay = journalEntry.creationDate.timeAgoDisplay()
        
        attributedText.append(NSAttributedString(string: timeAgoDisplay, attributes:
            [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
             NSAttributedStringKey.foregroundColor : UIColor.gray ]))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
