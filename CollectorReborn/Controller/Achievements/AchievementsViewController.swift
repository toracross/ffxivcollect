//
//  AchievementsViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Variables
    private var achievements: [Achievements] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchAchievements()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        navigationItem.title = "Achievements"
    }
    
    private func fetchAchievements() {
        FFXIVCollectService.shared.requestData(for: .achievements) { [weak self] (achievements: Achievement?) in
            guard let strongSelf = self, let achievements = achievements?.achievements else { return }
            strongSelf.achievements = achievements
            
            DispatchQueue.main.async {
                strongSelf.collectionView.reloadData()
            }
        }
    }
    
}

extension AchievementsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(achievements[indexPath.item])
    }
}

extension AchievementsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}

extension AchievementsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        cell.setCell(for: .achievements, with: achievements[indexPath.item])
        
        return cell
    }
}
