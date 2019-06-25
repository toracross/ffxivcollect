//
//  TTCard.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/22/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct TTCard: Codable {
    
    let cards: [TTCards]?
    
    enum CodingKeys: String, CodingKey {
        case cards = "results"
    }
    
    init(cards: [TTCards]?) {
        self.cards = cards
    }
    
}

struct TTCards: Codable, Comparable {
    
    let id: Int
    let sortId: Int?
    let name: String?
    let description: String?
    let stars: Int?
    let patch: String?
    let sellPrice: Int?
    let icon: String?
    let image: String?
    let stats: TTCardStats?
    let type: TTCardType?
    let owned: String?
    let sources: TTCardSources?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case sortId = "sort_id"
        case name = "name"
        case description = "description"
        case stars = "stars"
        case patch = "patch"
        case sellPrice = "sell_price"
        case icon = "icon"
        case image = "image"
        case stats = "stats"
        case type = "type"
        case owned = "owned"
        case sources = "sources"
    }
    
    init(id: Int, sortId: Int?, name: String?, description: String?, stars: Int?, patch: String?, sellPrice: Int?, icon: String?, image: String?, stats: TTCardStats?, type: TTCardType?, owned: String?, sources: TTCardSources?) {
        self.id = id
        self.sortId = sortId
        self.name = name
        self.description = description
        self.stars = stars
        self.patch = patch
        self.sellPrice = sellPrice
        self.icon = icon
        self.image = image
        self.stats = stats
        self.type = type
        self.owned = owned
        self.sources = sources
    }
    
    static func < (lhs: TTCards, rhs: TTCards) -> Bool {
        return lhs.id < rhs.id
    }
    
    static func == (lhs: TTCards, rhs: TTCards) -> Bool {
        return lhs.id == rhs.id
    }
    
}

struct TTCardStats: Codable {
    
    let numeric: TTCardStatsNumeric?
    let formatted: TTCardStatsFormatted?
    
    init(numeric: TTCardStatsNumeric?, formatted: TTCardStatsFormatted?) {
        self.numeric = numeric
        self.formatted = formatted
    }
    
}

struct TTCardStatsNumeric: Codable {
    
    let top: Int?
    let right: Int?
    let bottom: Int?
    let left: Int?
    
    init(top: Int?, right: Int?, bottom: Int?, left: Int?) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }
    
}

struct TTCardStatsFormatted: Codable {
    
    let top: String?
    let right: String?
    let bottom: String?
    let left: String?
    
    init(top: String?, right: String?, bottom: String?, left: String?) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }
    
}

struct TTCardType: Codable {
    
    let id: Int?
    let name: String?
    let image: String?
    
    init(id: Int?, name: String?, image: String?) {
        self.id = id
        self.name = name
        self.image = image
    }
    
}

struct TTCardSources: Codable {
    
    let npcs: [TTNPC]?
    let pack: TTCardPack?
    let drops: [String]?
    let purchase: Int?
    
    init(npcs: [TTNPC]?, pack: TTCardPack?, drops: [String]?, purchase: Int?) {
        self.npcs = npcs
        self.pack = pack
        self.drops = drops
        self.purchase = purchase
    }
    
}

struct TTNPC: Codable {
    
    let id: Int?
    let residentId: Int?
    let name: String?
    let patch: String?
    let location: TTNPCLocation?
    let quest: TTNPCQuest?
    let rules: [String]?
    let ruleIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case residentId = "resident_id"
        case name = "name"
        case patch = "patch"
        case location = "location"
        case quest = "quest"
        case rules = "rules"
        case ruleIds = "rule_ids"
    }
    
    init(id: Int?, residentId: Int?, name: String?, patch: String?, location: TTNPCLocation?, quest: TTNPCQuest?, rules: [String]?, ruleIds: [Int]?) {
        self.id = id
        self.residentId = residentId
        self.name = name
        self.patch = patch
        self.location = location
        self.quest = quest
        self.rules = rules
        self.ruleIds = ruleIds
    }
    
}

struct TTNPCLocation: Codable {
    
    let name: String?
    let region: String?
    let x: Int?
    let y: Int?
    
    init(name: String?, region: String?, x: Int?, y: Int?) {
        self.name = name
        self.region = region
        self.x = x
        self.y = y
    }
    
}

struct TTNPCQuest: Codable {
    
    let id: Int?
    let name: String?
    let link: String?
    
    init(id: Int?, name: String?, link: String?) {
        self.id = id
        self.name = name
        self.link = link
    }
    
}

struct TTCardPack: Codable {
    
    let id: Int?
    let name: String?
    let cost: Int?
    
    init(id: Int?, name: String?, cost: Int?) {
        self.id = id
        self.name = name
        self.cost = cost
    }
}
