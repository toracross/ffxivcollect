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
        fetchMounts()
    }
    
    // Functions
    private func setupUI() {
        navigationItem.title = "Mounts"
    }
    
    private func fetchMounts() {
        if let cacheData: Mount = CacheService.loadData(key: CacheService.CacheKey.mounts) {
            fetchMountsFromCache(mount: cacheData)
        } else {
            fetchMountsFromServer()
        }
    }
    
    private func fetchMountsFromCache(mount: Mount) {
        if let mounts = mount.mounts {
            self.mounts = mounts
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func fetchMountsFromServer() {
        showLoading()
        FFXIVCollectService.shared.requestData(for: .mounts) { [weak self] (mounts: Mount?) in
            guard let strongSelf = self, let data = mounts, let mounts = data.mounts else {
                self?.hideLoading()
                return
            }
            
            CacheService.saveData(type: data, key: CacheService.CacheKey.mounts)
            strongSelf.mounts = mounts
            
            DispatchQueue.main.async {
                strongSelf.hideLoading()
                strongSelf.collectionView.reloadData()
            }
        }
    }
    
    private func presentDetailedView(with mount: Mounts) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "MountDetailsViewController") as! MountDetailsViewController
        viewController.mount = mount
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
        return CGSize(width: collectionView.bounds.width / 5, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
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
