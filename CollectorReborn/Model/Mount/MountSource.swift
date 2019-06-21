//
//  MountSource.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

struct MountSource: Decodable {
    
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
    
    init(type: String?, text: String?, relatedType: String?, relatedId: Int?) {
        self.type = type
        self.text = text
        self.relatedType = relatedType
        self.relatedId = relatedId
    }
    
}
