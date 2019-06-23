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
    @IBOutlet weak var collectionView: UICollectionView!
    
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
                strongSelf.collectionView.reloadData()
            }
        }
    }
    
    private func presentDetailedView(with mount: Mounts) {
        let viewController = MountDetailsViewController(mount: mount)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension MountListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDetailedView(with: mounts[indexPath.item])
    }
}

extension MountListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}

extension MountListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        cell.setCell(for: .mounts, with: mounts[indexPath.item])
        
        return cell
    }
}
