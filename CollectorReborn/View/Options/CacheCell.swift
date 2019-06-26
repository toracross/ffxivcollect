//
//  CacheCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class CacheCell: UITableViewCell {
    
    @IBOutlet private weak var cacheTitleLabel: UILabel!
    @IBOutlet private weak var cacheSizeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCacheCell(name: String, size: String) {
        cacheTitleLabel.text = name
        cacheSizeLabel.text = size
    }
    
}
