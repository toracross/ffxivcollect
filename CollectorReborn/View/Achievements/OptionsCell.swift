//
//  OptionsCell.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class OptionsCell: UICollectionViewCell {
    
    // Outlets
    @IBOutlet private weak var optionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setOptions(with image: String) {
        optionImageView.image = UIImage(named: image)
    }
}
