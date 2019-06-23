//
//  AchievementsListViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private let headers: [String] = ["Total Points", "Category"]
    private var achievements: [Achievements] = []
    private var titles: [String] = []
    private var categoryCount: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        fetchAchievements()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        registerCells()
        setNavigationBar()
    }
    
    private func registerCells() {
        let tableHeaderCell = UINib(nibName: "TableHeaderCell", bundle: Bundle.main)
        let achievementPointsCell = UINib(nibName: "AchievementPointsCell", bundle: Bundle.main)
        let achievementCategoryCell = UINib(nibName: "AchievementCategoryCell", bundle: Bundle.main)
        
        tableView.register(tableHeaderCell, forCellReuseIdentifier: "TableHeaderCell")
        tableView.register(achievementPointsCell, forCellReuseIdentifier: "AchievementPointsCell")
        tableView.register(achievementCategoryCell, forCellReuseIdentifier: "AchievementCategoryCell")
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.shadowImage = FFXIVTheme.windowImage
    }
    
    private func fetchAchievements() {
        FFXIVCollectService.shared.requestData(for: .achievements) { [weak self] (achievement: Achievement?) in
            guard let strongSelf = self, let achievements = achievement?.achievements else { return }
            let sortedAchievements = achievements.sorted(by: { $0.type.id < $1.type.id })
            
            strongSelf.achievements = sortedAchievements
            strongSelf.titles = sortedAchievements.map({ $0.type.name }).removingDuplicates()
            strongSelf.categoryCount = strongSelf.sortCategories(sortedAchievements)
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
            }
        }
    }
    
    private func sortCategories(_ achievements: [Achievements]) -> [Int] {
        var categories: [Int] = []
        for category in achievements.map({ $0.type.id }).removingDuplicates() {
            categories.append(achievements.filter({ $0.type.id == category }).count)
        }
        return categories
    }
    
    private func filterCategories(_ achievements: [Achievements]) -> [Int] {
        var categories: [Int] = []
        for category in achievements.map({ $0.category.id }).removingDuplicates() {
            categories.append(achievements.filter({ $0.category.id == category }).count)
        }
        return categories
    }

}

extension AchievementsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filteredAchievements = achievements.filter({ $0.type.name == titles[indexPath.row] })
        let filteredNames = filteredAchievements.map({ $0.category.name }).removingDuplicates()
        let filteredCategories = filterCategories(filteredAchievements)
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "AchievementsCategoryViewController") as! AchievementsCategoryViewController
        viewController.titleText = titles[indexPath.row]
        viewController.achievements = filteredAchievements
        viewController.titles = filteredNames
        viewController.categoryCount = filteredCategories
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AchievementsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return titles.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 60 : 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableHeaderCell") as? TableHeaderCell else { return nil }
        
        cell.titleLabel.text = headers[section]
        cell.applySectionStyle(for: section)
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementPointsCell", for: indexPath) as? AchievementPointsCell else { return UITableViewCell() }
            
            cell.setAchievementPoints(with: 0)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementCategoryCell", for: indexPath) as? AchievementCategoryCell else { return UITableViewCell() }
            
            cell.setAchievementCategory(with: titles[indexPath.row], and: categoryCount[indexPath.row])
            
            return cell
            
        }
        
    }
}
