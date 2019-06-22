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
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        let achievementStoryboard = UIStoryboard(name: "Achievements", bundle: Bundle.main)
        let achievementViewController = achievementStoryboard.instantiateViewController(withIdentifier: "AchievementNavigationController")
        achievementViewController.tabBarItem = UITabBarItem(title: "Achievements", image: nil, selectedImage: nil)
        
        let mountStoryboard = UIStoryboard(name: "Mounts", bundle: Bundle.main)
        let mountViewController = mountStoryboard.instantiateViewController(withIdentifier: "MountListNavigationController")
        mountViewController.tabBarItem = UITabBarItem(title: "Mounts", image: nil, selectedImage: nil)
        
        let minionStoryboard = UIStoryboard(name: "Minions", bundle: Bundle.main)
        let minionViewController = minionStoryboard.instantiateViewController(withIdentifier: "MinionListNavigationController")
        minionViewController.tabBarItem = UITabBarItem(title: "Minions", image: nil, selectedImage: nil)
        
        viewControllers = [achievementViewController, mountViewController, minionViewController]
    }

}
