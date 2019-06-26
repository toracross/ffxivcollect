//
//  CharacterSearch.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct CharacterSearch: Codable {
    
    let results: [CharacterSearchResults]
    
    init(results: [CharacterSearchResults]) {
        self.results = results
    }
    
    enum CodingKeys: String, CodingKey {
        case results = "Results"
    }
    
}

struct CharacterSearchResults: Codable {
    
    let avatar: String
    let id: Int
    let name: String
    let server: String
    
    init(avatar: String, id: Int, name: String, server: String) {
        self.avatar = avatar
        self.id = id
        self.name = name
        self.server = server
    }
    
    enum CodingKeys: String, CodingKey {
        case avatar = "Avatar"
        case id = "ID"
        case name = "Name"
        case server = "Server"
    }
    
}
