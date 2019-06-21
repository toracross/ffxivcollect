//
//  Mount.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct MountResults: Decodable {
    let results: [Mount]?
    
    init(results: [Mount]?) {
        self.results = results
    }
}

struct Mount: Decodable {
    
    let id: Int?
    let name: String?
    let description: String?
    let enhancedDescription: String?
    let tooltip: String?
    let flying: Bool?
    let movement: String?
    let seats: Int?
    let order: Int?
    let patch: String?
    let itemId: Int?
    let owned: String?
    let image: String?
    let icon: String?
    let sources: [MountSource]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case enhancedDescription = "enhanced_description"
        case tooltip = "tooltip"
        case flying = "flying"
        case movement = "movement"
        case seats = "seats"
        case order = "order"
        case patch = "patch"
        case itemId = "item_id"
        case owned = "owned"
        case image = "image"
        case icon = "icon"
        case sources = "sources"
    }
    
    
    init(id: Int?, name: String?, description: String?, enhancedDescription: String?, tooltip: String?, flying: Bool?, movement: String?, seats: Int?, order: Int?, patch: String?, itemId: Int?, owned: String?, image: String?, icon: String?, sources: [MountSource]) {
        self.id = id
        self.name = name
        self.description = description
        self.enhancedDescription = enhancedDescription
        self.tooltip = tooltip
        self.flying = flying
        self.movement = movement
        self.seats = seats
        self.order = order
        self.patch = patch
        self.itemId = itemId
        self.owned = owned
        self.image = image
        self.icon = icon
        self.sources = sources
    }
    
}
