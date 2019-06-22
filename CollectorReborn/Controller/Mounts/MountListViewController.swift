//
//  TestViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/21/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class MountListViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private var mounts: [Mounts] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        testAPI()
    }
    
    // Functions
    private func setupUI() {
        navigationItem.title = "Mounts"
    }
    
    private func testAPI() {
        FFXIVCollectService.shared.requestData(for: .mounts) { [weak self] (mounts: Mount?) in
            guard let strongSelf = self, let mounts = mounts?.mounts else { return }
            strongSelf.mounts = mounts
            
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
            }
        }
    }
    
}

extension MountListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(mounts[indexPath.row])
    }
}


extension MountListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mounts[indexPath.row].name
        cell.imageView?.setImageFromURL(string: mounts[indexPath.row].icon)
        return cell
    }
}
