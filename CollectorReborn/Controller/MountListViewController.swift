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
    private var mounts: [Mount] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        testAPI()
    }
    
    // Functions
    private func setupUI() {
        
    }
    
    private func testAPI() {
        FFXIVCollectService.shared.requestData(for: .mounts) { [weak self] (mounts) in
            guard let strongSelf = self, let mounts = mounts else { return }
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
//        let viewController = MountDetailsViewController(mount: mounts[indexPath.row])
//        present(viewController, animated: true, completion: nil)
    }
}


extension MountListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mounts[indexPath.row].name
        return cell
    }
}
