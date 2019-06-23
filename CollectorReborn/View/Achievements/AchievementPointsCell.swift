//
//  AchievementsListCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementPointsCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Functions
    func setAchievementPoints(with points: Int) {
        totalPointsLabel.text = "\(points)"
    }
}
