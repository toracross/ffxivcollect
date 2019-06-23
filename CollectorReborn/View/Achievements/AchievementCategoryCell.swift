//
//  AchievementCategoryCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementCategoryCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Functions
    func setAchievementCategory(with title: String?, and count: Int) {
        categoryLabel.text = title
        totalLabel.text = "\(count)"
    }
}

