//
//  Character.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct Character: Codable {
    
    let id: Int?
    let name: String?
    let server: String?
    let portrait: String?
    let avatar: String?
    let verified: Bool?
    let achievements: CharacterAchievements?
    let mounts: CharacterMounts?
    let minions: CharacterMinions?
    let orchestrions: CharacterOrchestrions?
    let emotes: CharacterEmotes?
    let bardings: CharacterBardings?
    let hairstyles: CharacterHairstyles?
    let armoires: CharacterArmoires?
    let triad: CharacterTriadCards?
    
}

struct CharacterAchievements: Codable {
    let count: Int
    let total: Int
    let points: Int
    let pointsTotal: Int
    let isPublic: Bool
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case total = "total"
        case points = "points"
        case pointsTotal = "points_total"
        case isPublic = "public"
    }
}

struct CharacterMounts: Codable {
    let count: Int
    let total: Int
}

struct CharacterMinions: Codable {
    let count: Int
    let total: Int
}

struct CharacterOrchestrions: Codable {
    let count: Int
    let total: Int
}

struct CharacterEmotes: Codable {
    let count: Int
    let total: Int
}

struct CharacterBardings: Codable {
    let count: Int
    let total: Int
}

struct CharacterHairstyles: Codable {
    let count: Int
    let total: Int
}

struct CharacterArmoires: Codable {
    let count: Int
    let total: Int
}

struct CharacterTriadCards: Codable {
    let count: Int
    let total: Int
}
