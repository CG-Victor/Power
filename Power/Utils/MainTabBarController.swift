//
//  MainTabBarController.swift
//  Power
//
//  Created by Chris Gonzaga on 8/22/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import Firebase
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        if Auth.auth().currentUser == nil {
            //show if not logged in
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            
            return
        }
        
        setupViewControllers()

    }
    
    func setupViewControllers() {
        // goals
        let goalJournalController = templateNavController(unselectedImage: #imageLiteral(resourceName: "goals"), selectedImage: #imageLiteral(resourceName: "goals"), rootViewController: GoalsJournalController(collectionViewLayout: UICollectionViewFlowLayout())) 

        
        // meditation
        let meditationController = templateNavController(unselectedImage: #imageLiteral(resourceName: "meditation"), selectedImage: #imageLiteral(resourceName: "meditation"), rootViewController: MeditationController())
        
        
        // selfLove
        let beliefsListController = templateNavController(unselectedImage:#imageLiteral(resourceName: "selfLove"), selectedImage: #imageLiteral(resourceName: "selfLove"), rootViewController: BeliefsListController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        // grateful
        let gratefulController = templateNavController(unselectedImage: #imageLiteral(resourceName: "grateful"), selectedImage: #imageLiteral(resourceName: "grateful"), rootViewController: UIViewController())
        
        viewControllers = [
            goalJournalController,
            meditationController,
            beliefsListController,
            gratefulController
            ]
        
        
    
        
        guard let items = tabBar.items else { return }
        
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        }
        
        self.selectedIndex = 2
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    

}





