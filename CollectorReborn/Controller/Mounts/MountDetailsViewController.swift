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
    
    // Variables
    private var mount: Mounts
    
    override func viewDidLoad() {
        navigationItem.title = mount.name
        view.backgroundColor = .white
    }
    
    init(mount: Mounts) {
        self.mount = mount
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Storyboard Actions
    
    // Functions
    
}
