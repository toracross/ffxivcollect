//
//  CharacterViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    
    // Variables
    private var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchCharacter()
    }
    
    // Storyboard Actions
    @IBAction private func searchButtonPressed(_ sender: UIBarButtonItem) {
        presentSearchMenu()
    }
    
    // Functions
    private func setupUI() {
        setTitle()
    }
    
    private func setTitle() {
        navigationItem.title = "Character"
    }
    
    private func fetchCharacter() {
        guard let cacheData: Character = CacheService.loadData(key: CacheService.CacheKey.character) else { return }
        
        fetchCharacterFromCache(with: cacheData)
    }
    
    private func fetchCharacterFromCache(with character: Character) {
        navigationItem.title = character.name
        characterImageView.setImageFromURL(string: character.portrait)
        print(character)
    }
    
    private func presentSearchMenu() {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "CharacterSearchViewController")
        present(viewController!, animated: true, completion: nil)
    }
    
}

