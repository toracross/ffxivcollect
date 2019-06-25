//
//  Achievement.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct Achievement: Codable {
    
    let achievements: [Achievements]?
    
    enum CodingKeys: String, CodingKey {
        case achievements = "results"
    }
    
    init(achievements: [Achievements]?) {
        self.achievements = achievements
    }
    
}

struct Achievements: Codable, Comparable {
    let id: Int
    let name: String?
    let description: String?
    let points: Int?
    let order: Int?
    let patch: String?
    let owned: String?
    let icon: String?
    let category: AchievementCategory
    let type: AchievementType
    let reward: AchievementReward?
    
    init(id: Int, name: String?, description: String?, points: Int?, order: Int?, patch: String?, owned: String?, icon: String?, category: AchievementCategory, type: AchievementType, reward: AchievementReward?) {
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
        self.reward = reward
    }
    
    
    static func < (lhs: Achievements, rhs: Achievements) -> Bool {
        return lhs.id < rhs.id
    }
    
    static func == (lhs: Achievements, rhs: Achievements) -> Bool {
        return lhs.id == rhs.id
    }
    
}

struct AchievementCategory: Codable {
    let id: Int
    let name: String
}

struct AchievementType: Codable, Hashable {
    let id: Int
    let name: String
}

struct AchievementReward: Codable {
    let type: String?
    let title: AchievementRewardTitle?
    let name: String?
    
    init(type: String?, title: AchievementRewardTitle?, name: String?) {
        self.type = type
        self.title = title
        self.name = name
    }
}

struct AchievementRewardTitle: Codable {
    let id: Int?
    let name: String?
    let femaleName: String?
    let order: Int?
    let owned: String?
    let icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case femaleName = "female_name"
        case order = "order"
        case owned = "owned"
        case icon = "icon"
    }
    
    init(id: Int?, name: String?, femaleName: String?, order: Int?, owned: String?, icon: String?) {
        self.id = id
        self.name = name
        self.femaleName = femaleName
        self.order = order
        self.owned = owned
        self.icon = icon
    }
}
