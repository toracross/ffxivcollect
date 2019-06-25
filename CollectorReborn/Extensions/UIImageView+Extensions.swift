//
//  UIImageView+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    public func setImageFromURL(string: String?) {
        guard let urlString = string else {
            self.image = UIImage(named: "moogle")
            return
        }
        self.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "moogle"))
    }
}

