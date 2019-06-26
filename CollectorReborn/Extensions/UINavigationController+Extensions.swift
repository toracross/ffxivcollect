//
//  UINavigationController+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

extension UINavigationBar {
    open override func awakeFromNib() {
        shadowImage = FFXIVTheme.windowImage
    }
}
