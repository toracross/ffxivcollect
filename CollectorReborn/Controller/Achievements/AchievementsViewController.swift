//
//  AchievementsListViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/23/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    private enum Categories: Int {
        case battle
        case pvp
        case character
        case items
        case crafting
        case gathering
        case quests
        case exploration
        case grandCompany
        case legacy
        
        var limit: Int {
            switch self {
            case .battle:
                return 304
            case .pvp:
                return 182
            case .character:
                return 324
            case .items:
                return 271
            case .crafting:
                return 172
            case .gathering:
                return 109
            case .quests:
                return 347
            case .exploration:
                return 158
            case .grandCompany:
                return 72
            case .legacy:
                return 261
            }
        }
    }
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private let headers = ["Total Points", "Category"]
    private var sections = ["Battle", "PvP", "Character", "Items", "Crafting", "Gathering", "Quests", "Exploration", "Grand Company", "Legacy"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        registerCells()
        setNavigationBar()
        tableView.reloadWithAnimation(withDuration: 0.25)
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
}

extension AchievementsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "AchievementsCategoryViewController") as! AchievementsCategoryViewController
        viewController.titleText = sections[indexPath.row]
        viewController.limit = Categories(rawValue: indexPath.row)?.limit ?? 0
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AchievementsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : sections.count
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
            
            cell.setAchievementCategory(with: sections[indexPath.row])
            
            return cell
        }
        
    }
}
