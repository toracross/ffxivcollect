//
//  UIImageView+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

extension UIImageView {
    public func setImageFromURL(string: String?) {
        self.image = UIImage(named: "moogle")
        guard let urlString = string, let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data)
                self.image = image
            })
        }.resume()
    }
}
