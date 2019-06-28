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
    @IBOutlet weak var cardImageView: UIImageView!
    
    // Variables
    var card: TTCards?
    
    override func viewDidLoad() {
//        print(card)
        navigationItem.title = card?.name
        cardImageView.setImageFromURL(string: card?.image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TTARViewController, let card = card else { return }
        destination.card = card
    }
    
    // Storyboard Actions
    
    // Functions
    
}
