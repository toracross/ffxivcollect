//
//  AchievementsCategoryViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementsCategoryViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var titleText: String?
    var achievements: [Achievements] = []
    var titles: [String] = []
    var categoryCount: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        navigationItem.title = titleText
        registerCell()
    }
    
    private func registerCell() {
        let achievementCategoryCell = UINib(nibName: "AchievementCategoryCell", bundle: Bundle.main)
        tableView.register(achievementCategoryCell, forCellReuseIdentifier: "AchievementCategoryCell")
    }

}

extension AchievementsCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AchievementsCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementCategoryCell", for: indexPath) as? AchievementCategoryCell else { return UITableViewCell() }
        
        cell.setAchievementCategory(with: titles[indexPath.row], and: categoryCount[indexPath.row])
        
        return cell
    }
}
