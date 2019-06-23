//
//  UITabBar+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

@IBDesignable extension UITabBar {
    
    @IBInspectable var setBackgroundImage: UIImage? {
        set {
            self.backgroundImage = UIImage()
        }
        get {
            return self.backgroundImage
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let value = newValue else { return }
            layer.borderColor = value.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            roundTopCorners(with: newValue)
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
