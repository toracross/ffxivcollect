//
//  TableHeaderCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class TableHeaderCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func applySectionStyle(for section: Int) {
        section == 0 ? applyPointStyle() : applyCategoryStyle()
    }
    
    private func applyPointStyle() {
        titleLabel.font = UIFont(name: "Jupiter Condensed SCOsF", size: 20)
    }
    
    private func applyCategoryStyle() {
        titleLabel.font = UIFont(name: "Jupiter Condensed SCOsF", size: 30)
    }
}
