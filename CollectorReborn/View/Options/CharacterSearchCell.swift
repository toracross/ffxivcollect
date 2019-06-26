//
//  CharacterSearchCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class CharacterSearchCell: UITableViewCell {
    
    // Outlets
    @IBOutlet private weak var characterAvatarImageView: UIImageView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterServerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCharacter(with character: CharacterSearchResults) {
        characterAvatarImageView.setImageFromURL(string: character.avatar)
        characterNameLabel.text = character.name
        characterServerLabel.text = character.server
    }
}
