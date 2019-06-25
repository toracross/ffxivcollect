//
//  UIViewController+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showLoading() {
        // Instantiate Image
        let animatedView = UIImageView()
        animatedView.frame.size = CGSize(width: 200, height: 200)
        animatedView.center = view.center
        animatedView.layer.cornerRadius = 13
        animatedView.backgroundColor = .clear
        animatedView.tag = 99999
        animatedView.layer.zPosition = 0
        
        // Add GIF
        var imageArray: [UIImage] = []
        
        for i in 1...15 {
            if let image = UIImage(named: "loadingmoogle-\(i)"){
                imageArray.append(image)
            }
        }
        
        animatedView.animationImages = imageArray
        animatedView.animationDuration = 0.5
        animatedView.startAnimating()
        
        //Add as Subview
        view.addSubview(animatedView)
        animatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoading() {
        view.viewWithTag(99999)?.removeFromSuperview()
    }
    
}
