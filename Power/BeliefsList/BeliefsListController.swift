//
//  BeliefsListController.swift
//  Power
//
//  Created by Chris Gonzaga on 8/27/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import UIKit
import Firebase

//LimitingBeliefsTextViewDelegate


class BeliefsListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var journalEntries = [JournalEntry]()
    
    
    fileprivate func fetchEntry() {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        Database.fetchUserWithUID(uid: uid) { (user) in
            self.fetchEntriesWithUsers(user: user)
        }
    }

    fileprivate func fetchEntriesWithUsers(user: User) {

        let ref = Database.database().reference().child("journalEntries").child(user.uid)
        ref.queryOrdered(byChild: "creationDate").observe(.childAdded, with: { (snapshot) in

            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
//            guard let user = user else { return }
            
            let journalEntry = JournalEntry(user: user, dictionary: dictionary)
            
            self.journalEntries.insert(journalEntry, at: 0)

            self.collectionView?.reloadData()
    

        }) { (err) in
            print("Failed to observe comments")
        }
    }
    
    
    
    
    
    
//    var user: User?
//    fileprivate func fetchOrderedEntries() {
//        guard let uid = self.user?.uid else { return }
//        let ref = Database.database().reference().child("journalEntries").child(uid)
//
//        ref.queryOrdered(byChild: "creationDate").observe(.childAdded) { (snapshot) in
//            guard let dictionary = snapshot.value as? [String: Any] else { return }
//
//            guard let user = self.user else { return }
//
//            let journalEntry = JournalEntry(user: user, dictionary: dictionary)
//
//            self.journalEntries.insert(journalEntry, at: 0)
//
//            self.collectionView?.reloadData()
//        }
//
//    }
//
  
 
//    fileprivate func fetchUser() {
//
//        let uid = Auth.auth().currentUser?.uid ?? ""
//
//
//        Database.fetchUserWithUID(uid: uid) { (user) in
//            self.user = user
//            self.navigationItem.title = self.user?.username
//
//            self.collectionView?.reloadData()
//            self.fetchOrderedEntries()
//        }
//    }
    
    
    
//    fileprivate func fetchOrderedEntries() {
//        guard let currentUser = Auth.auth().currentUser?.uid else { return }
//
//
    
//        guard let uid = self.user?.uid else { return }
//        let ref = Database.database().reference().child("journalEntries").child(uid)
//
//        //perhaps later on we'll implement some pagination of data
//        ref.observe(.childAdded, with: { (snapshot) in
//            guard let dictionary = snapshot.value as? [String: Any] else { return }
//
//            guard let user = self.user else { return }
//
//            let journalEntry = JournalEntry(user: user, dictionary: dictionary)
//
//            self.journalEntries.append(journalEntry)
//
//            self.collectionView?.reloadData()
//
//        }) { (err) in
//            print("Failed to fetch ordered posts:", err)
//        }
//    }
    
    
    
    
    
    

    let headerId = "headerId"
    let cellId = "cellId"
    
   
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .green
        return container
    }()
    

    
    
    fileprivate let addJournalEntry: UIButton = {
        let sb = UIButton(type: .system)
        sb.setTitle("Add Journal Entry", for: .normal)
        sb.setTitleColor(.red, for: .normal)
        sb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        sb.addTarget(self, action: #selector(handleAddJournalEntry), for: .touchUpInside)
        return sb
    }()
    
    @objc func handleAddJournalEntry() {
        print("Presenting Journal Entry")
        
        let beliefListJournalEntryController = BeliefsListJournalEntryController()
        //        let navController = UINavigationController(rootViewController: beliefListJournalEntryController)
        //
        
    
        navigationController?.pushViewController(beliefListJournalEntryController, animated: true)
    }
   
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        
        fetchEntry()

      
        collectionView?.backgroundColor = .purple
        
        collectionView?.register(BeliefsListHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(BeliefsListCell.self, forCellWithReuseIdentifier: cellId)
        

        
        
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        containerView.addSubview(addJournalEntry)
        addJournalEntry.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        
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

        cell.journalEntry = self.journalEntries[indexPath.item]
        
        
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
    
    override func viewDidLayoutSubviews() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.isStatusBarHidden = true
    
         self.collectionView?.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        UIApplication.shared.isStatusBarHidden = true
        self.collectionView?.reloadData()
    }
   
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
}
