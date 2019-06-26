//
//  OptionsCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class OptionsCell: UITableViewCell {
    
    // Outlets
    @IBOutlet private weak var optionImageView: UIImageView!
    @IBOutlet weak var optionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setOptions(with option: OptionsViewController.Option) {
        optionImageView.image = UIImage(named: option.image)
        optionsLabel.text = option.title
        
        if option.title != "Cache" {
            optionsLabel.text = "\(option.title) - NYI"
        }
        
    }
}
