//
//  CacheViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class CacheViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private let defaults = UserDefaults.standard
    private var cacheItems: [String] = []
    private var itemSize: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        populateCacheOptions()
    }
    
    // Functions
    private func setupUI() {
        setTitle()
        registerCell()
    }
    
    private func setTitle() {
        navigationItem.title = "Cache"
    }
    
    private func registerCell() {
        let optionsCell = UINib(nibName: "CacheCell", bundle: Bundle.main)
        tableView.register(optionsCell, forCellReuseIdentifier: "CacheCell")
    }
    
    private func populateCacheOptions() {
        cacheItems.removeAll()
        
        let filteredKeys = defaults.dictionaryRepresentation().keys.filter({ !$0.contains("NS") && !$0.contains("Apple") && !$0.contains("IDMS") && !$0.contains("Emoji") && !$0.contains("Keychain")})
        
        cacheItems.append(contentsOf: filteredKeys)
        tableView.reloadWithAnimation(withDuration: 0.25)
    }
    
    
}

extension CacheViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deleteCachePrompt(cache: cacheItems[indexPath.row], index: indexPath.row)
    }
    
    private func deleteCachePrompt(cache: String, index: Int) {
        let alert = UIAlertController(title: "Clear cache for \(cache)?", message: "This will delete all associated items from cache, proceed?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Clear", style: .destructive) { (_) in
            self.defaults.removeObject(forKey: cache)
            self.cacheItems.remove(at: index)
            self.tableView.reloadWithAnimation(withDuration: 0.25)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension CacheViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cacheItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CacheCell", for: indexPath) as? CacheCell else { return UITableViewCell() }
        
        cell.setCacheCell(name: cacheItems[indexPath.row], size: "")
        
        return cell
    }
    
}

