//
//  AchievementsCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/22/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell<T: Decodable>(for type: FFXIVCollectService.RequestType, with data: T) {
        switch type {
        case .achievements:
            guard let achievement = data as? Achievements else { return }
            setAchievements(with: achievement)
        case .minions:
            guard let minion = data as? Minions else { return }
            setMinion(with: minion)
        case .mounts:
            guard let mount = data as? Mounts else { return }
            setMount(with: mount)
        case .tripleTriadCards:
            guard let card = data as? TTCards else { return }
            setCard(with: card)
        default: break
        }
    }
}

// MARK: - Achievements
private extension CollectionViewCell {
    func setAchievements(with data: Achievements) {
        iconImageView.setImageFromURL(string: data.icon)
    }
}

// MARK: - Minions
private extension CollectionViewCell {
    func setMinion(with data: Minions) {
        iconImageView.setImageFromURL(string: data.icon)
    }
}

// MARK: - Mounts
private extension CollectionViewCell {
    func setMount(with data: Mounts) {
        iconImageView.setImageFromURL(string: data.icon)
    }
}

private extension CollectionViewCell {
    func setCard(with data: TTCards) {
        iconImageView.setImageFromURL(string: data.icon)
    }
}
