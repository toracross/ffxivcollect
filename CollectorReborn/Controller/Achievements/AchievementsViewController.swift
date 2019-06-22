//
//  AchievementsViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private var achievements: [Achievements] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchAchievements()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        navigationItem.title = "Achievements"
    }
    
    private func fetchAchievements() {
        FFXIVCollectService.shared.requestData(for: .achievements) { [weak self] (achievements: Achievement?) in
            guard let strongSelf = self, let achievements = achievements?.achievements else { return }
            strongSelf.achievements = achievements
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
            }
        }
    }
    
}

extension AchievementsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(achievements[indexPath.row])
    }
}

extension AchievementsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = achievements[indexPath.row].name
        cell.imageView?.setImageFromURL(string: achievements[indexPath.row].icon)
        return cell
    }
}
