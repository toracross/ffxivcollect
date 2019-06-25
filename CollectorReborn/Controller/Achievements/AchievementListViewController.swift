//
//  AchievementListViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementListViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var titleText = String()
    var achievements: [Achievements] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Functions
    private func setupUI() {
        setTitle()
        registerCell()
    }
    
    private func setTitle() {
        navigationItem.title = titleText
    }
    
    private func registerCell() {
        let cell = UINib(nibName: "AchievementCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "AchievementCell")
    }

}

extension AchievementListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(achievements[indexPath.row])
    }
}

extension AchievementListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementCell", for: indexPath) as? AchievementCell else { return UITableViewCell() }
        
        cell.setupCell(with: achievements[indexPath.row])
        
        return cell
    }
}
