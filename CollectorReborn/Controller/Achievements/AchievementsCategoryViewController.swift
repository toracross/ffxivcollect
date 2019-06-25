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
    private var achievements: [Achievements] = []
    private var categories: [String] = []
    private var count: [Int] = []
    var titleText = String()
    var limit = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        navigationItem.title = titleText
        registerCell()
        fetchAchievements()
    }
    
    private func registerCell() {
        let achievementCategoryCell = UINib(nibName: "AchievementCategoryCell", bundle: Bundle.main)
        tableView.register(achievementCategoryCell, forCellReuseIdentifier: "AchievementCategoryCell")
    }
    
    private func fetchAchievements() {
        if let cacheData: Achievement = CacheService.loadData(key: titleText) {
            fetchAchievementsFromCache(achievement: cacheData)
        } else {
            fetchAchievementsFromServer()
        }
    }
    
    private func fetchAchievementsFromCache(achievement: Achievement) {
        if let achievements = achievement.achievements {
            self.achievements = achievements
            categories = achievements.map({ $0.category.name }).removingDuplicates()
            count = filterCategories(achievements)
            
            DispatchQueue.main.async {
                self.hideLoading()
                self.tableView.reloadWithAnimation(withDuration: 0.25)
            }
        }
    }
    
    private func fetchAchievementsFromServer() {
        showLoading()
        FFXIVCollectService.shared.requestData(for: .achievements(category: titleText, limit: limit)) { [weak self](data: Achievement?) in
            guard let strongSelf = self, let achievement = data, let achievements = achievement.achievements else {
                self?.hideLoading()
                return
            }
            
            CacheService.saveData(type: achievement, key: strongSelf.titleText)
            strongSelf.achievements = achievements
            strongSelf.categories = achievements.map({ $0.category.name }).removingDuplicates()
            strongSelf.count = strongSelf.filterCategories(achievements)
            
            DispatchQueue.main.async {
                strongSelf.hideLoading()
                strongSelf.tableView.reloadWithAnimation(withDuration: 0.25)
            }
        }
    }
    
    private func filterCategories(_ achievements: [Achievements]) -> [Int] {
        var categories: [Int] = []
        for category in achievements.map({ $0.category.id }).removingDuplicates() {
            categories.append(achievements.filter({ $0.category.id == category }).count)
        }
        return categories
    }

}

extension AchievementsCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "AchievementListViewController") as! AchievementListViewController
        viewController.titleText = categories[indexPath.row]
        viewController.achievements = achievements.filter({ $0.category.name == categories[indexPath.row] }).sorted()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AchievementsCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementCategoryCell", for: indexPath) as? AchievementCategoryCell else { return UITableViewCell() }
        
        cell.setAchievementCategory(with: categories[indexPath.row])
        
        return cell
    }
}
