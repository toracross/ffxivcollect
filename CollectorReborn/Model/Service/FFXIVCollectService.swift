//
//  FFXIVCollectService.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

public let XIVServerListURL = "https://xivapi.com/servers"
public let APICollectURL = "https://collect.raelys.com/api/"
public let APITriadURL = "https://triad.raelys.com/api/"
public let XIVAPICharacterSearchURL = "https://xivapi.com/character/search/"

final class FFXIVCollectService {
    
    enum RequestType {
        case achievement(name: String)
        case achievements(category: String, limit: Int)
        case character(id: Int)
        case characterSearch(name: String, server: String)
        case minion(name: String)
        case minions
        case mount(name: String)
        case mounts
        case servers
        case tripleTriadCard(name: String)
        case tripleTriadCards
        case tripleTriadCardPack(name: String)
        case tripleTriadCardPacks
    }
    
    static let shared = FFXIVCollectService()
    
    func requestData<T: Decodable>(for type: RequestType, completed: @escaping (T?) -> ()) {
        var url: URL?
        
        switch type {
        case .achievement(let name):
            url = URL(string: "\(APICollectURL)achievements?name_en_cont=\(name)")
        case .achievements(let category, let limit):
            let newCategory = category.replacingOccurrences(of: "Grand Company", with: "Grand+Company")
            url = URL(string: "\(APICollectURL)achievements?limit=\(limit)&category_type_name_en_eq=\(newCategory)")
        case .character(let id):
            url = URL(string: "\(APICollectURL)characters/\(id)")
        case .characterSearch(let name, let server):
            let newName = name.replacingOccurrences(of: " ", with: "+")
            url = URL(string: "\(XIVAPICharacterSearchURL)?name=\(newName)&server=\(server)")
        case .minion(let name):
            url = URL(string: "\(APICollectURL)minions?name_en_cont=\(name)")
        case .minions:
            url = URL(string: "\(APICollectURL)minions?limit=9000")
        case .mount(let name):
            url = URL(string: "\(APICollectURL)mounts?name_en_cont=\(name)")
        case .mounts:
            url = URL(string: "\(APICollectURL)mounts?limit=9000")
        case .servers:
            url = URL(string: XIVServerListURL)
        case .tripleTriadCard(let name):
            url = URL(string: "\(APITriadURL)cards?name_en_cont=\(name)")
        case .tripleTriadCards:
            url = URL(string: "\(APITriadURL)cards")
        case .tripleTriadCardPack(let name):
            url = URL(string: "\(APITriadURL)packs?name_en_start=\(name)")
        case .tripleTriadCardPacks:
            url = URL(string: "\(APITriadURL)packs")
        }
        
        guard let safeUrl = url else {
            completed(nil)
            return
        }
        
        fetchData(with: safeUrl) { (T) in completed(T) }
    }
    
    private func fetchData<T: Decodable>(with url: URL, completed: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completed(json)
            } catch let error {
                completed(nil)
                print(error)
            }
            
        }.resume()
    }
    
}

extension FFXIVCollectService {
    class func fetchServers(with url: URL, completed: @escaping ([String]) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed([])
                return
            }
            
            do {
                let json = try JSONDecoder().decode([String].self, from: data)
                completed(json)
            } catch let error {
                completed([])
                print(error)
            }
            
        }.resume()
    }
}
