//
//  MountDetailsViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class MountDetailsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var mountImageView: UIImageView!
    
    // Variables
    var mount: Mounts?
    
    override func viewDidLoad() {
        print(mount!)
        navigationItem.title = mount?.name
        mountImageView.setImageFromURL(string: mount?.image)
    }
    
    // Storyboard Actions
    
    // Functions
    
}
