//
//  Achievement.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct Achievement: Decodable {
    
    let achievements: [Achievements]?
    
    enum CodingKeys: String, CodingKey {
        case achievements = "results"
    }
    
    init(achievements: [Achievements]?) {
        self.achievements = achievements
    }
    
}

struct Achievements: Decodable {
    
    let id: Int?
    let name: String?
    let description: String?
    let points: Int?
    let order: Int?
    let patch: String?
    let owned: String?
    let icon: String?
    let category: AchievementCategory?
    let type: AchievementType?
    
    init(id: Int?, name: String?, description: String?, points: Int?, order: Int?, patch: String?, owned: String?, icon: String?, category: AchievementCategory?, type: AchievementType?) {
        self.id = id
        self.name = name
        self.description = description
        self.points = points
        self.order = order
        self.patch = patch
        self.owned = owned
        self.icon = icon
        self.category = category
        self.type = type
    }
    
}

struct AchievementCategory: Decodable {
    
    let id: Int?
    let name: String?
    
}

struct AchievementType: Decodable {
    
    let id: Int?
    let name: String?
    
}
