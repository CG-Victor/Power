////
////  BeliefsListController.swift
////  Power
////
////  Created by Chris Gonzaga on 8/27/18.
////  Copyright © 2018 Chris Gonzaga. All rights reserved.
////
//
//import UIKit
//import Firebase
//
////LimitingBeliefsTextViewDelegate
//
//
//class BeliefsListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//    
//    
//    // now we fetch, let's go to cellForItemAt and its actual page
//    
//    var journalEntries = [JournalEntry]()
//    
//    fileprivate func fetchPost() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        
//        Database.fetchUserWithUID(uid: uid) { (user) in
//            self.fetchEntriesWithUsers(user: user)
//        }
//    }
//    
//    fileprivate func fetchEntriesWithUsers(user: User) {
//        // now this parent, journalEntries has child, user.uid
//        let ref = Database.database().reference().child("journalEntries").child(user.uid)
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            
//            guard let dictionaries = snapshot.value as? [String: Any] else { return }
//            
//            // key: String, value: Any, we're giving them names.
//            
//            dictionaries.forEach({ (key, value) in
//                guard let dictionary = value as? [String: Any] else { return }
//                
//                var journalEntry = JournalEntry(user: user, dictionary: dictionary)
//                journalEntry.id = key // this is the part where the code worked
//                
//                // all about uploading. Change submit into save now!
//                
//                self.journalEntries.append(journalEntry)
//                self.collectionView?.reloadData()
//                
//            })
//            
//            
//            
//            ////            print(snapshot.value)
//            //            guard let dictionary = snapshot.value as? [String: Any] else { return }
//            //            // even data structure, of the way you use "xyz[ ]" has to be accurate
//            //            guard let title = dictionary["title"] as? String else { return }
//            //            guard let text = dictionary["text"] as? String else { return }
//            //            guard let user = dictionary["username"] as? String else { return }
//            //
//            ////            guard let dictionary = snapshot.value as? [String: Any] else { return }
//            //            let journalEntry = JournalEntry(user: user, title: title, text: text, dictionary: dictionary)
//            //
//            //
//            //            self.journalEntries.append(journalEntry)
//            //
//            //
//            //            self.collectionView?.reloadData()
//            
//        }) { (err) in
//            print("Failed to observe comments")
//        }
//    }
//    
//    
//    
//    //    fileprivate func fetchEntries() {
//    //        let ref = Database.database().reference().child("journalEntries")
//    //        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//    //
//    //            self.collectionView?.refreshControl?.endRefreshing()
//    //
//    //            guard let dictionaries = snapshot.value as? [String: Any] else { return }
//    //
//    //            dictionaries.forEach({ (key, value) in
//    //                guard let dictionary = value as? [String: Any] else { return }
//    //
//    //                var journalEntry = JournalEntry(title: <#T##String#>, text: <#T##String#>, dictionary: <#T##[String : Any]#>)
//    ////                var post = Post(user: user, dictionary: dictionary)
//    ////                post.id = key
//    //
//    //                guard let uid = Auth.auth().currentUser?.uid else { return }
//    //                Database.database().reference().child("likes").child(key).child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
//    //                    //                    print(snapshot)
//    //
//    //                    if let value = snapshot.value as? Int, value == 1 {
//    //                        post.hasLiked = true
//    //                    } else {
//    //                        post.hasLiked = false
//    //                    }
//    //
//    //                    self.posts.append(post)
//    //                    self.posts.sort(by: { (p1, p2) -> Bool in
//    //                        return p1.creationDate.compare(p2.creationDate) == .orderedDescending
//    //                    })
//    //                    self.collectionView?.reloadData()
//    //
//    //                }, withCancel: { (err) in
//    //                    print("Failed to fetch like info for post:", err)
//    //                })
//    //            })
//    //
//    //        }) { (err) in
//    //            print("Failed to fetch posts:", err)
//    //        }
//    //    }
//    
//    
//    //    func didSubmit() {
//    ////
//    ////
//    ////        let dummyCell = BeliefsListCell()
//    ////        guard let indexPath = collectionView?.indexPath(for: dummyCell) else { return }
//    ////
//    ////        var journalEntry = self.journalEntries[indexPath.item]
//    //
//    //
//    ////        self.journalEntries.append(dummyCell)
//    ////        self.journalEntries[indexPath.item] = journalEntry
//    ////        self.collectionView?.reloadItems(at: [indexPath])
//    ////        self.collectionView?.reloadData()
//    //
//    //    }
//    //
//    
//    
//    let headerId = "headerId"
//    let cellId = "cellId"
//    
//    
//    let containerView: UIView = {
//        let container = UIView()
//        container.backgroundColor = .green
//        return container
//    }()
//    
//    
//    
//    
//    fileprivate let addJournalEntry: UIButton = {
//        let sb = UIButton(type: .system)
//        sb.setTitle("Add Journal Entry", for: .normal)
//        sb.setTitleColor(.red, for: .normal)
//        sb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        sb.addTarget(self, action: #selector(handleAddJournalEntry), for: .touchUpInside)
//        return sb
//    }()
//    
//    @objc func handleAddJournalEntry() {
//        print("Presenting Journal Entry")
//        
//        let beliefListJournalEntryController = BeliefsListJournalEntryController()
//        //        let navController = UINavigationController(rootViewController: beliefListJournalEntryController)
//        //
//        
//        
//        navigationController?.pushViewController(beliefListJournalEntryController, animated: true)
//    }
//    
//    
//    override func viewDidLoad() {
//        super .viewDidLoad()
//        
//        print(journalEntries)
//        
//        fetchPost()
//        
//        collectionView?.backgroundColor = .purple
//        
//        collectionView?.register(BeliefsListHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
//        collectionView?.register(BeliefsListCell.self, forCellWithReuseIdentifier: cellId)
//        
//        //        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addJournalEntry))
//        
//        
//        view.addSubview(containerView)
//        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
//        
//        containerView.addSubview(addJournalEntry)
//        addJournalEntry.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
//        
//    }
//    
//    //    @objc func addJournalEntry() {
//    //
//    //
//    //
//    ////
//    //        let beliefListJournalEntryController = BeliefsListJournalEntryController()
//    ////        let navController = UINavigationController(rootViewController: beliefListJournalEntryController)
//    ////
//    //        navigationController?.pushViewController(beliefListJournalEntryController, animated: true)
//    //
//    //
//    //
//    //        // BEFORE
//    //
//    ////        let beliefListJournalEntryController = BeliefsListJournalEntryController()
//    ////        present(beliefListJournalEntryController, animated: true, completion: nil)
//    ////
//    //
//    //    }
//    
//    
//    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! BeliefsListHeader
//        
//        return header
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 200)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BeliefsListCell
//        //
//        cell.journalEntry = self.journalEntries[indexPath.item]
//        
//        
//        return cell
//    }
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return journalEntries.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let width = (view.frame.width - 2) / 2
//        
//        
//        return CGSize(width: width, height: width)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        
//        //        let selectedEntry = journalEntries[indexPath.item]
//        
//        let beliefListJournalEntryController = BeliefsListJournalEntryController()
//        navigationController?.pushViewController(beliefListJournalEntryController, animated: true)
//    }
//    
//    
//    
//    
//    
//    
//    // *** NAVIGATION BAR HIDDEN
//    //    override func viewDidLayoutSubviews() {
//    //        navigationController?.setNavigationBarHidden(true, animated: false)
//    //    }
//    //
//    //    override func viewWillAppear(_ animated: Bool) {
//    //        navigationController?.setNavigationBarHidden(false, animated: false)
//    //    }
//    //
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
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    
//    
//    
//}








// AFTER THE CLEAN UP, SMALL DETAIL UPDATE. COULDN'T FETCH USER WITH THIS



//fileprivate func fetchEntriesWithUsers(user: User) {
//
//    let ref = Database.database().reference().child("journalEntries").child(user.uid)
//    ref.observe(.childAdded, with: { (snapshot) in
//
//        guard let dictionary = snapshot.value as? [String: Any] else { return }
//
//        //            guard let user = user else { return }
//
//        let journalEntry = JournalEntry(user: user, dictionary: dictionary)
//
//        self.journalEntries.append(journalEntry)
//
//        self.collectionView?.reloadData()
//
//
//        /* /// THIS PREVIOUSLY DIDN'T WORK, the isolation above was better
//         guard let dictionaries = snapshot.value as? [String: Any] else { return }
//
//         // key: String, value: Any, we're giving them names.
//
//         dictionaries.forEach({ (key, value) in
//         guard let dictionary = value as? [String: Any] else { return }
//
//         var journalEntry = JournalEntry(user: user, dictionary: dictionary)
//         journalEntry.id = key
//
//         self.journalEntries.append(journalEntry)
//
//
//         self.collectionView?.reloadData()
//
//         })
//         */
//
//
//
//    }) { (err) in
//        print("Failed to observe comments")
//    }
//}

