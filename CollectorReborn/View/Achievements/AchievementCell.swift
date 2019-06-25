//
//  AchievementCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementCell: UITableViewCell {
    
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var achievementTitleLabel: UILabel!
    @IBOutlet weak var achievementValueLabel: UILabel!
    @IBOutlet weak var achievementDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with achievement: Achievements) {
        achievementImageView.setImageFromURL(string: achievement.icon)
        achievementTitleLabel.text = achievement.name
        achievementValueLabel.text = "\(achievement.points ?? 0)"
        achievementDescriptionLabel.text = achievement.description
    }
}
