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
    @IBOutlet weak var minionImageView: UIImageView!
    
    // Variables
    var minion: Minions?
    
    override func viewDidLoad() {
//        print(minion)
        navigationItem.title = minion?.name
        minionImageView.setImageFromURL(string: minion?.image)
    }
    
    // Storyboard Actions
    
    // Functions

}
