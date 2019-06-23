//
//  TabBarController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let achievementStoryboard = UIStoryboard(name: "Achievements", bundle: Bundle.main)
        let achievementViewController = achievementStoryboard.instantiateViewController(withIdentifier: "AchievementNavigationController")
        let achievementImage = UIImage(named: "achievements\([0, 1, 2].randomElement() ?? 0)")?.withRenderingMode(.alwaysOriginal)
        achievementViewController.tabBarItem = UITabBarItem(title: "Achievements", image: achievementImage, selectedImage: achievementImage)
        
        let mountStoryboard = UIStoryboard(name: "Mounts", bundle: Bundle.main)
        let mountViewController = mountStoryboard.instantiateViewController(withIdentifier: "MountListNavigationController")
        let mountImage = UIImage(named: "mountguide\([0, 1, 2].randomElement() ?? 0)")?.withRenderingMode(.alwaysOriginal)
        mountViewController.tabBarItem = UITabBarItem(title: "Mounts", image: mountImage, selectedImage: mountImage)
        
        let minionStoryboard = UIStoryboard(name: "Minions", bundle: Bundle.main)
        let minionViewController = minionStoryboard.instantiateViewController(withIdentifier: "MinionListNavigationController")
        let minionImage = UIImage(named: "minionguide\([0, 1, 2].randomElement() ?? 0)")?.withRenderingMode(.alwaysOriginal)
        minionViewController.tabBarItem = UITabBarItem(title: "Minions", image: minionImage, selectedImage: minionImage)
        
        let ttStoryboard = UIStoryboard(name: "TripleTriad", bundle: Bundle.main)
        let ttViewController = ttStoryboard.instantiateViewController(withIdentifier: "TTCardsViewController")
        let cardImage = UIImage(named: "ttcard\([0, 1, 2].randomElement() ?? 0)")?.withRenderingMode(.alwaysOriginal)
        ttViewController.tabBarItem = UITabBarItem(title: "Triple Triad", image: cardImage, selectedImage: cardImage)
        
        viewControllers = [achievementViewController, mountViewController, minionViewController, ttViewController]
    }

}
