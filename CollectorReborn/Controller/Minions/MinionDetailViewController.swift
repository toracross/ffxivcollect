//
//  MinionDetailViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/22/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class MinionDetailViewController: UIViewController {

    // Outlets
    
    // Variables
    private var minion: Minions
    
    override func viewDidLoad() {
        print(minion)
        navigationItem.title = minion.name
        view.backgroundColor = .white
    }
    
    init(minion: Minions) {
        self.minion = minion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Storyboard Actions
    
    // Functions

}
