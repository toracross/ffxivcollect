//
//  FFXIVCollectService.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

final class FFXIVCollectService {
    
    enum RequestType {
        case achievement(name: String)
        case achievements
        case minion(name: String)
        case minions
        case mount(name: String)
        case mounts
    }
    
    static let shared = FFXIVCollectService()
    
    func requestData<T: Decodable>(for type: RequestType, completed: @escaping (T?) -> ()) {
        switch type {
        case .achievement(let name):
            getAchievement(with: name) { (T) in completed(T) }
        case .achievements:
            getAchievements { (T) in completed(T) }
        case .minion(let name):
            getMinion(with: name) { (T) in completed(T) }
        case .minions:
            getMinions { (T) in completed(T) }
        case .mount(let name):
            getMount(with: name) { (T) in completed(T) }
        case .mounts:
            getMounts { (T) in completed(T) }
        }
    }
    
}

// MARK: - Achievements
private extension FFXIVCollectService {
    
    func getAchievement<T: Decodable>(with name: String, completed: @escaping (T?) -> ()) {
        let urlString = "https://collect.raelys.com/api/achievements?name_en_cont=\(name)"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let mounts = try decoder.decode(T.self, from: data)
                completed(mounts)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func getAchievements<T: Decodable>(completed: @escaping (T?) -> ()) {
        let urlString = "https://collect.raelys.com/api/achievements?limit=9000"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(T.self, from: data)
                completed(results)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
}

// MARK: - Minions
private extension FFXIVCollectService {
    func getMinion<T: Decodable>(with name: String, completed: @escaping (T?) -> ()) {
        let urlString = "https://collect.raelys.com/api/minions?name_en_cont=\(name)"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let mounts = try decoder.decode(T.self, from: data)
                completed(mounts)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func getMinions<T: Decodable>(completed: @escaping (T?) -> ()) {
        let urlString = "https://collect.raelys.com/api/minions?limit=9000"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(T.self, from: data)
                completed(results)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}

// MARK: - Mounts
private extension FFXIVCollectService {
    
    func getMount<T: Decodable>(with name: String, completed: @escaping (T?) -> ()) {
        let urlString = "https://collect.raelys.com/api/mounts?name_en_cont=\(name)"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let mounts = try decoder.decode(T.self, from: data)
                completed(mounts)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func getMounts<T: Decodable>(completed: @escaping (T?) -> ()) {
        let urlString = "https://collect.raelys.com/api/mounts?limit=9000"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(T.self, from: data)
                completed(results)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
}
