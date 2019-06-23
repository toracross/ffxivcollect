//
//  TTCardsViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/22/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class TTCardsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // Variables
    private var cards: [TTCards] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getCards()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        navigationItem.title = "Triple Triad Cards"
    }
    
    private func getCards() {
        FFXIVCollectService.shared.requestData(for: .tripleTriadCards) { [weak self] (cards: TTCard?) in
            guard let strongSelf = self, let cards = cards?.cards else { return }
            strongSelf.cards = cards
            
            DispatchQueue.main.async {
                strongSelf.collectionView.reloadData()
            }
        }
    }
    
    private func presentDetailedView(with card: TTCards) {
        let viewController = TTCardsDetailViewController(card: card)
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension TTCardsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDetailedView(with: cards[indexPath.item])
    }
}

extension TTCardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}

extension TTCardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        cell.setCell(for: .tripleTriadCards, with: cards[indexPath.item])
        
        return cell
    }
}
