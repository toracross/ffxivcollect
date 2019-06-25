//
//  OptionsViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    enum Option {
        case character
        case ui
        case audio
        case cache
        case logout
        
        var title: String {
            switch self {
            case .character: return "Character"
            case .ui: return "UI"
            case .audio: return "Audio"
            case .cache: return "Cache"
            case .logout: return "Log Out"
            }
        }
        
        var image: String {
            switch self {
            case .character: return "character"
            case .ui: return "ui"
            case .audio: return "sound"
            case .cache: return "cache"
            case .logout: return "logout"
            }
        }
    }
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Variables
    private var grids: [Option] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setTitle()
        registerCell()
        setDataSource()
    }
    
    private func setTitle() {
        navigationItem.title = "Options"
    }
    
    private func registerCell() {
        let optionsCell = UINib(nibName: "OptionsCell", bundle: Bundle.main)
        collectionView.register(optionsCell, forCellWithReuseIdentifier: "OptionsCell")
    }
    
    private func setDataSource() {
        grids.append(contentsOf: [Option.character, Option.ui, Option.audio, Option.cache, Option.logout])
        collectionView.reloadData()
    }

}

extension OptionsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(grids[indexPath.item])
    }
}

extension OptionsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

extension OptionsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionsCell", for: indexPath) as? OptionsCell else { return UICollectionViewCell() }
        
        cell.setOptions(with: grids[indexPath.item].image)
        
        return cell
    }
    
}
