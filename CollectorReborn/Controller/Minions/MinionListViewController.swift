//
//  MinionListViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class MinionListViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Variables
    private var minions: [Minions] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchMinions()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        navigationItem.title = "Minions"
    }
    
    private func fetchMinions() {
        if let cacheData: Minion = CacheService.loadData(key: CacheService.CacheKey.minions) {
            fetchMinionsFromCache(minion: cacheData)
        } else {
            fetchMinionsFromServer()
        }
    }
    
    private func fetchMinionsFromCache(minion: Minion) {
        if let minions = minion.minions {
            self.minions = minions
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func fetchMinionsFromServer() {
        showLoading()
        FFXIVCollectService.shared.requestData(for: .minions) { [weak self] (minions: Minion?) in
            guard let strongSelf = self, let data = minions, let minions = minions?.minions else {
                self?.hideLoading()
                return
            }
            
            CacheService.saveData(type: data, key: CacheService.CacheKey.minions)
            strongSelf.minions = minions
            
            DispatchQueue.main.async {
                strongSelf.collectionView.reloadData()
                strongSelf.hideLoading()
            }
        }
    }
    
    private func presentDetailedView(with minion: Minions) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "MinionDetailViewController") as! MinionDetailViewController
        viewController.minion = minion
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension MinionListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDetailedView(with: minions[indexPath.item])
    }
}

extension MinionListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 5, height: 100)
    }
}

extension MinionListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return minions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        cell.setCell(for: .minions, with: minions[indexPath.item])
        
        return cell
    }
}

