//
//  UINavigationController+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/27/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    
    /// Presents a view controller in an embedded Navigation Controller separate from the current navigation stack.
    ///
    /// - Parameter viewController: The UIViewController to embed.
    func present(_ viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        hideNavigationBar()
        addCloseButton(to: navigationItem)
        UIApplication.topViewController()?.present(navigationController, animated: true, completion: nil)
    }
    
    func hideNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
    func addCloseButton(to navigationItem: UINavigationItem) {
        let closeButton = UIButton()
        closeButton.setTitle("X", for: .normal)
        closeButton.addTarget(self, action: #selector(dismiss(animated:completion:)), for: .touchUpInside)
        
        let closeButtonItem = UIBarButtonItem(customView: closeButton)
        navigationItem.leftBarButtonItem = closeButtonItem
    }
    
}
