//
//  FFXIVCollectService.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

public let APICollectURL = "https://collect.raelys.com/api/"
public let APITriadURL = "https://triad.raelys.com/api/"

final class FFXIVCollectService {
    
    enum RequestType {
        case achievement(name: String)
        case achievements
        case minion(name: String)
        case minions
        case mount(name: String)
        case mounts
        case tripleTriadCard(name: String)
        case tripleTriadCards
    }
    
    static let shared = FFXIVCollectService()
    
    func requestData<T: Decodable>(for type: RequestType, completed: @escaping (T?) -> ()) {
        var url: URL?
        
        switch type {
        case .achievement(let name):
            url = URL(string: "\(APICollectURL)achievements?name_en_cont=\(name)")
        case .achievements:
            url = URL(string: "\(APICollectURL)achievements?limit=9000")
        case .minion(let name):
            url = URL(string: "\(APICollectURL)minions?name_en_cont=\(name)")
        case .minions:
            url = URL(string: "\(APICollectURL)minions?limit=9000")
        case .mount(let name):
            url = URL(string: "\(APICollectURL)mounts?name_en_cont=\(name)")
        case .mounts:
            url = URL(string: "\(APICollectURL)mounts?limit=9000")
        case .tripleTriadCard(let name):
            url = URL(string: "\(APITriadURL)cards?name_en_cont=\(name)")
        case .tripleTriadCards:
            url = URL(string: "\(APITriadURL)cards")
        }
        
        fetchData(with: url!) { (T) in completed(T) }
    }
    
    func fetchData<T: Decodable>(with url: URL, completed: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completed(json)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
}
