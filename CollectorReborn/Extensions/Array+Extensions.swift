//
//  Array+Extensions.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
