//
//  FFXIVTheme.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

final class FFXIVTheme {
    
    static let windowImage = UIImage(named: "yellowborder")
    
    enum GeneralColor {
        static let backgroundColor: UIColor = .init(red: 50, green: 50, blue: 150, alpha: 1)
        static let windowBorder: UIColor = .init(red: 108, green: 92, blue: 63, alpha: 1)
        static let windowHeaderTop: UIColor = .init(red: 89, green: 89, blue: 89, alpha: 1)
        static let windowHeaderBottom: UIColor = .init(red: 63, green: 63, blue: 63, alpha: 1)
    }
    
    enum AchievementColor {
        static let starColor: UIColor = .init(red: 223, green: 201, blue: 145, alpha: 1)
        static let grayText: UIColor = .init(red: 128, green: 128, blue: 128, alpha: 1)
        static let yellowText: UIColor = .init(red: 239, green: 227, blue: 210, alpha: 1)
        static let sectionTop: UIColor = .init(red: 89, green: 89, blue: 89, alpha: 1)
        static let sectionBottom: UIColor = .init(red: 55, green: 55, blue: 55, alpha: 1)
        static let progressBarEmpty: UIColor = .init(red: 107, green: 162, blue: 44, alpha: 1)
        static let progressBarFull: UIColor = .init(red: 167, green: 225, blue: 80, alpha: 1)
    }
    
}
