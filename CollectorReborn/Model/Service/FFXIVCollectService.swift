//
//  FFXIVCollectService.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import Foundation

typealias MountCompletion = (_: Mount?) -> ()
typealias MountsCompletion = (_: [Mount]?) -> ()

final class FFXIVCollectService {
    
    enum RequestType {
        case mount
        case mounts
    }
    
    static let shared = FFXIVCollectService()
    
    func requestData(for type: RequestType, completed: @escaping MountsCompletion) {
        switch type {
        case .mount:
//            getSpecificMount(mountId: "") { (mount) in
//                completed(mount)
//            }
            break
        case .mounts:
            requestMountData { (mounts) in
                completed(mounts)
            }
            break
        }
    }
    
    private func getSpecificMount(mountId: String, completed: @escaping MountCompletion) {
        let urlString = "https://collect.raelys.com/api/mounts/186"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let mounts = try decoder.decode(Mount.self, from: data)
                completed(mounts)
            } catch let error {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    private func requestMountData(completed: @escaping MountsCompletion) {
        let urlString = "https://collect.raelys.com/api/mounts?limit=9000"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completed([])
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(MountResults.self, from: data)
                completed(results.results)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
}
