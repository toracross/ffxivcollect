//
//  OptionsViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    enum Option {
        case character
        case ui
        case audio
        case cache
        case logout
        
        var title: String {
            switch self {
            case .character: return "Character"
            case .ui: return "UI"
            case .audio: return "Audio"
            case .cache: return "Cache"
            case .logout: return "Log Out"
            }
        }
        
        var image: String {
            switch self {
            case .character: return "character"
            case .ui: return "ui"
            case .audio: return "sound"
            case .cache: return "cache"
            case .logout: return "logout"
            }
        }
    }
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private var rows: [Option] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setTitle()
        registerCell()
        setDataSource()
    }
    
    private func setTitle() {
        navigationItem.title = "Options"
    }
    
    private func registerCell() {
        let optionsCell = UINib(nibName: "OptionsCell", bundle: Bundle.main)
        tableView.register(optionsCell, forCellReuseIdentifier: "OptionsCell")
    }
    
    private func setDataSource() {
        rows.append(contentsOf: [Option.character, Option.ui, Option.audio, Option.cache, Option.logout])
        tableView.reloadData()
    }

}

extension OptionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentMenu(for: rows[indexPath.row])
    }
    
    private func presentMenu(for row: Option) {
        var viewController: UIViewController
        
        switch row {
        case .character:
            viewController = storyboard?.instantiateViewController(withIdentifier: "CacheViewController") as! CacheViewController
            break
        case .ui:
            viewController = storyboard?.instantiateViewController(withIdentifier: "CacheViewController") as! CacheViewController
            break
        case .audio:
            viewController = storyboard?.instantiateViewController(withIdentifier: "CacheViewController") as! CacheViewController
            break
        case .cache:
            viewController = storyboard?.instantiateViewController(withIdentifier: "CacheViewController") as! CacheViewController
        case .logout:
            viewController = storyboard?.instantiateViewController(withIdentifier: "CacheViewController") as! CacheViewController
            break
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension OptionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsCell", for: indexPath) as? OptionsCell else { return UITableViewCell() }
        
        cell.setOptions(with: rows[indexPath.row])
        
        return cell
    }
    
}
