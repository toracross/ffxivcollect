//
//  TTPack.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/22/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct TTPack: Decodable {
    
    let packs: [TTCardPacks]?
    
    enum CodingKeys: String, CodingKey {
        case packs = "results"
    }
    
    init(packs: [TTCardPacks]?) {
        self.packs = packs
    }
    
}

struct TTCardPacks: Decodable {
    
    let id: Int?
    let name: String?
    let cost: Int?
    let cards: [TTCards]?
    
    init(id: Int?, name: String?, cost: Int?, cards: [TTCards]?) {
        self.id = id
        self.name = name
        self.cost = cost
        self.cards = cards
    }
    
}
