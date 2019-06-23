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
        case .tripleTriadCardPacks:
            guard let card = data as? TTCardPacks else { return }
            setPack(with: card)
        default: break
        }
    }
}

// MARK: - Achievements
private extension CollectionViewCell {
    func setAchievements(with achievement: Achievements) {
        iconImageView.setImageFromURL(string: achievement.icon)
    }
}

// MARK: - Minions
private extension CollectionViewCell {
    func setMinion(with minion: Minions) {
        iconImageView.setImageFromURL(string: minion.image)
    }
}

// MARK: - Mounts
private extension CollectionViewCell {
    func setMount(with mount: Mounts) {
        iconImageView.setImageFromURL(string: mount.image)
    }
}

// MARK: - Triple Triad Cards
private extension CollectionViewCell {
    func setCard(with card: TTCards) {
        iconImageView.setImageFromURL(string: card.image)
    }
}

// MARK: - Triple Triad Card Packs
private extension CollectionViewCell {
    func setPack(with pack: TTCardPacks) {
//        iconImageView.setImageFromURL(string: data.)
    }
}
