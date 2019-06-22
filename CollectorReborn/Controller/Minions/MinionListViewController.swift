//
//  MinionListViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class MinionListViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private var minions: [Minions] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getMinions()
    }
    
    // Storyboard Actions
    
    // Functions
    private func setupUI() {
        navigationItem.title = "Minions"
    }
    
    private func getMinions() {
        FFXIVCollectService.shared.requestData(for: .minions) { [weak self] (minions: Minion?) in
            guard let strongSelf = self, let minions = minions?.minions else { return }
            strongSelf.minions = minions
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
            }
        }
    }

}

extension MinionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(minions[indexPath.row])
    }
}

extension MinionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = minions[indexPath.row].name
        cell.imageView?.setImageFromURL(string: minions[indexPath.row].icon)
        return cell
    }
}
