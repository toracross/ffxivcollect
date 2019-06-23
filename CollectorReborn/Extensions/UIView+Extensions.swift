//
//  UIView+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

extension UIView {
    func roundTopCorners(with value: CGFloat) {
        self.layer.maskedCorners.remove([.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
        self.clipsToBounds = false
        self.layer.cornerRadius = value
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func roundBottomCorners() {
        self.layer.maskedCorners.remove([.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        self.clipsToBounds = false
        self.layer.cornerRadius = 6
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

@IBDesignable class GradientView: UIView {
    @IBInspectable var topColor: UIColor = UIColor.white
    @IBInspectable var bottomColor: UIColor = UIColor.black
    
    @IBInspectable var viewCornerRadius: CGFloat{
        set {
            self.layer.cornerRadius = newValue
        } get {
            return self.layer.cornerRadius
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
