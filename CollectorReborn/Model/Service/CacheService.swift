//
//  CacheService.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/24/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

class CacheService {
    
    enum CacheKey {
        static let character = "Character"
        static let mounts = "Mounts"
        static let minions = "Minions"
        static let tripleTriad = "Triple Triad"
    }
    
    class func saveData<T: Codable>(type: T, key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(type) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: key)
        }
    }
    
    class func loadData<T: Codable>(key: String) -> T? {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(T.self, from: data) {
                return object
            }
        }
        return nil
    }
    
}
