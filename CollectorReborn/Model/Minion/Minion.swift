//
//  Minion.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct Minion: Decodable {
    
    let minions: [Minions]?
    
    enum CodingKeys: String, CodingKey {
        case minions = "results"
    }
    
    init(minions: [Minions]?) {
        self.minions = minions
    }
    
}

struct Minions: Decodable {
    
    let id: Int?
    let name: String?
    let description: String?
    let enhancedDescription: String?
    let tooltip: String?
    let patch: String?
    let itemId: Int?
    let behavior: MinionBehavior?
    let race: MinionRace?
    let image: String?
    let icon: String?
    let owned: String?
    let sources: [MinionSources]?
    let verminion: Verminion?
    
}

struct MinionBehavior: Decodable {
    let id: Int?
    let name: String?
}

struct MinionRace: Decodable {
    let id: Int?
    let name: String?
}

struct MinionSources: Decodable {
    let type: String?
    let text: String?
    let relatedType: String?
    let relatedId: Int?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case relatedType = "related_type"
        case relatedId = "related_id"
    }
}

struct Verminion: Decodable {
    
    let cost: Int?
    let attack: Int?
    let defense: Int?
    let hp: Int?
    let speed: Int?
    let areaAttack: Bool?
    let skill: String?
    let skillDescription: String?
    let skillAngle: Int?
    let skillCost: Int?
    let eye: Bool?
    let gate: Bool?
    let shield: Bool?
    let skillType: VerminionSkillType?
    
    enum CodingKeys: String, CodingKey {
        case cost = "cost"
        case attack = "attack"
        case defense = "defense"
        case hp = "hp"
        case speed = "speed"
        case areaAttack = "area_attack"
        case skill = "skill"
        case skillDescription = "skill_description"
        case skillAngle = "skill_angle"
        case skillCost = "skill_cost"
        case eye = "eye"
        case gate = "gate"
        case shield = "shield"
        case skillType = "skill_type"
    }
    
}

struct VerminionSkillType: Decodable {
    let id: Int?
    let name: String?
}
