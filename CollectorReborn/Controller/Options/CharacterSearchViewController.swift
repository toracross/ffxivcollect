//
//  CharacterSearchViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/25/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit

class CharacterSearchViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var serverButton: UIButton!
    
    // Variables
    private var characters: [CharacterSearchResults] = []
    private var servers: [String] = []
    private let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Storyboard Actions
    @IBAction private func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func searchButtonPressed(_ sender: UIButton) {
        guard let name = textField.text, let server = serverButton.title(for: .normal) else { return }
        
        showLoading()
        FFXIVCollectService.shared.requestData(for: .characterSearch(name: name, server: server)) { [weak self] (results: CharacterSearch?) in
            guard let strongSelf = self, let characters = results?.results else {
                self?.hideLoading()
                return
            }
            strongSelf.characters = characters
            
            DispatchQueue.main.async {
                strongSelf.hideLoading()
                strongSelf.tableView.reloadWithAnimation(withDuration: 0.25)
            }
            
        }
    }
    
    @IBAction private func serverSelectButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", message: "Select a server", preferredStyle: .actionSheet)
        alert.view.addSubview(pickerView)
        
        pickerView.frame.size = CGSize(width: alert.view.frame.size.width, height: alert.view.frame.size.width)
        
        NSLayoutConstraint.activate([
                pickerView.topAnchor.constraint(equalTo: alert.view.safeAreaLayoutGuide.topAnchor),
                pickerView.leftAnchor.constraint(equalTo: alert.view.safeAreaLayoutGuide.leftAnchor),
                pickerView.rightAnchor.constraint(equalTo: alert.view.safeAreaLayoutGuide.rightAnchor)
            ])
        
        let doneButton = UIAlertAction(title: "Done", style: .default) { (_) in
            self.pickerView.endEditing(true)
        }
        
        alert.addAction(doneButton)
        present(alert, animated: true, completion: nil)
    }
    
    // Functions
    private func setupUI() {
        setTitle()
        setupPicker()
        setupTextField()
        registerCell()
    }
    
    private func setTitle() {
        navigationItem.title = "Character Search"
    }
    
    private func setupPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        servers = ["Aegis", "Alexander", "Anima", "Asura", "Atomos", "Bahamut", "Balmung", "Behemoth", "Belias", "Brynhildr", "Cactuar", "Carbuncle", "Cerberus", "Chocobo", "Coeurl", "Diabolos", "Durandal", "Excalibur", "Exodus", "Faerie", "Famfrit", "Fenrir", "Garuda", "Gilgamesh", "Goblin", "Gungnir", "Hades", "Hyperion", "Ifrit", "Ixion", "Jenova", "Kujata", "Lamia", "Leviathan", "Lich", "Louisoix", "Malboro", "Mandragora", "Masamune", "Mateus", "Midgardsormr", "Moogle", "Odin", "Omega", "Pandaemonium", "Phoenix", "Ragnarok", "Ramuh", "Ridill", "Sargatanas", "Shinryu", "Shiva", "Siren", "Spriggan", " Tiamat", "Titan", "Tonberry", "Twintania", "Typhon", "Ultima", "Ultros", "Unicorn", "Valefor", "Yojimbo", "Zalera", "Zeromus", "Zodiark"]
        
        pickerView.reloadAllComponents()
    }
    
    private func setupTextField() {
        textField.attributedPlaceholder = NSAttributedString(string: "Character Name", attributes: [
            .foregroundColor: FFXIVTheme.AchievementColor.yellowText,
            .font: UIFont(name: "Jupiter Condensed SCOsF", size: 20)!])
    }
    
    private func registerCell() {
        let cell = UINib(nibName: "CharacterSearchCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "CharacterSearchCell")
    }
    
}

extension CharacterSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showLoading()
        
        FFXIVCollectService.shared.requestData(for: .character(id: characters[indexPath.row].id)) { [weak self] (results: Character?) in
            guard let strongSelf = self, let character = results else {
                self?.hideLoading()
                return
            }
            
            CacheService.saveData(type: character, key: CacheService.CacheKey.character)
            strongSelf.dismiss(animated: true, completion: nil)
        }
    }
}

extension CharacterSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterSearchCell", for: indexPath) as? CharacterSearchCell else { return UITableViewCell() }
        
        cell.setCharacter(with: characters[indexPath.row])
        
        return cell
    }
}

extension CharacterSearchViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        serverButton.setTitle(servers[row], for: .normal)
    }
}

extension CharacterSearchViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return servers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return servers[row]
    }
}
