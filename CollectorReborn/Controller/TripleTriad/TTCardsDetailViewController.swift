//
//  TTCardsDetailViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/22/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class TTCardsDetailViewController: UIViewController {
    
    // Outlets
    
    // Variables
    private var card: TTCards
    
    override func viewDidLoad() {
        print(card)
        navigationItem.title = card.name
        view.backgroundColor = .white
    }
    
    init(card: TTCards) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Storyboard Actions
    
    // Functions
    
}
