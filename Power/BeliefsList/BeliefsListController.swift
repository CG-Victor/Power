//
//  BeliefsListController.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import UIKit

class BeliefsListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let headerId = "headerId"
    let cellId = "cellId"
    
    var journalEntries = [JournalEntry]()
    var journalDraft = [UIPageViewController]()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        
        collectionView?.backgroundColor = .purple
        
        collectionView?.register(BeliefsListHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(BeliefsListCell.self, forCellWithReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addJournalEntry))
    }
    
    @objc func addJournalEntry() {
//        navigationController?.pushViewController(beliefListJournalEntryController, animated: true)

        
        let beliefListJournalEntryController = BeliefsListJournalEntryController()
        
        let navController = UINavigationController(rootViewController: beliefListJournalEntryController)
//        journalEntries.append(beliefListJournalEntryController)
//        journalDraft.append(beliefListJournalEntryController)
        
        present(navController, animated: true, completion: nil)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! BeliefsListHeader
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BeliefsListCell
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalEntries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2) / 2
        
        
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
//        let selectedEntry = journalEntries[indexPath.item]
        
        let beliefListJournalEntryController = BeliefsListJournalEntryController()
        navigationController?.pushViewController(beliefListJournalEntryController, animated: true)
    }


    
    // *** NAVIGATION BAR HIDDEN
//    override func viewDidLayoutSubviews() {
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: false)
//    }
//
   
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
}
