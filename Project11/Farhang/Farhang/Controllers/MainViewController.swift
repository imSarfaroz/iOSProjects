//
//  ViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit
import SQLite

class MainViewController: UIViewController, UIBarPositioningDelegate {
    let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
    
    var isLanguageMenuOpened:Bool = false
    var isSettingsOpened:Bool = false
    var filteredSearchDictionary = [Dictionary]()
    var dictionaryType:Int = 1
    
    // Main tableView
    @objc private let discoverTable: UITableView = {
        let table = UITableView()
        table.register(DescriptionUITableViewCell.self, forCellReuseIdentifier: DescriptionUITableViewCell.identifies)
        table.keyboardDismissMode = .onDrag
        table.rowHeight = 55
        return table
    }()
    
    // Searching feature functions
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Калимаро ворид кунед..."
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.spellCheckingType = .no
        controller.searchBar.autocapitalizationType = .none
        controller.hidesNavigationBarDuringPresentation = false
        return controller
    }()
    
    func filterRowsForSearchedText(_ searchText: String) {
        words.removeAll()
        words = SQLiteCommands.presentRows(id: dictionaryType, searchText: searchText)
        discoverTable.reloadData()
    }
    //toolbar for keyboard
    func addToolBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        var flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil)
        
        //items
        let letterButton1 = UIBarButtonItem(title: "Ҳ", style: .done,  target: self, action:  #selector(changeTheLetter1))
        flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil)
        let letterButton2 = UIBarButtonItem(title: "Ӯ", style: .done, target: self, action: #selector(changeTheLetter2))
        flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil)
        let letterButton3 = UIBarButtonItem(title: "Ғ", style: .done, target: self, action: #selector(changeTheLetter3))
        flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil)
        let letterButton4 = UIBarButtonItem(title: "Ҷ", style: .done, target: self, action: #selector(changeTheLetter4))
        flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil)
        let letterButton5 = UIBarButtonItem(title: "Қ", style: .done, target: self, action: #selector(changeTheLetter5))
        flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil)
        let letterButton6 = UIBarButtonItem(title: "Й", style: .done, target: self, action: #selector(changeTheLetter6))
        flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action:nil)
        
        toolBar.items = [letterButton1,flexibleSpace1, letterButton2,flexibleSpace1, letterButton3,flexibleSpace1, letterButton4,flexibleSpace1, letterButton5,flexibleSpace1 ,letterButton6,]
        
        if #available(iOS 13.0, *) {
            toolBar.tintColor = UIColor.label
        } else {
            toolBar.tintColor = UIColor.black
        }
    
        self.searchController.searchBar.inputAccessoryView = toolBar
    }
    
    @objc func changeTheLetter1() {
        searchController.searchBar.text! += "ҳ"
    }
    @objc func changeTheLetter2() {
        searchController.searchBar.text! += "ӯ"
    }
    @objc func changeTheLetter3() {
        searchController.searchBar.text! += "ғ"
    }
    @objc func changeTheLetter4() {
        searchController.searchBar.text! += "ҷ"
    }
    @objc func changeTheLetter5() {
        searchController.searchBar.text! += "қ"
    }
    @objc func changeTheLetter6() {
        searchController.searchBar.text! += "й"
    }
    
    let languageMenuListView: MenuListView = {
        let view = MenuListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let settingsListView: SettingsView = {
        let view = SettingsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        words = SQLiteCommands.presentRows(id: 1)
    }
    
    var words: [Dictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = changeTheTitleName("Тоҷики-Руси")
        view.addSubview(discoverTable)
        
        discoverTable.delegate = self
        discoverTable.dataSource = self
        discoverTable.tableHeaderView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        
        // Tap gestures
        let tapGestureLabel1 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.myFirstLabelViewTapped(_:)))
        tapGestureLabel1.numberOfTapsRequired = 1
        languageMenuListView.textLabel1.addGestureRecognizer(tapGestureLabel1)
        
        let tapGestureLabel2 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.mySecondLabelViewTapped(_:)))
        tapGestureLabel2.numberOfTapsRequired = 1
        languageMenuListView.textLabel2.addGestureRecognizer(tapGestureLabel2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.myThirdLabelViewTapped(_:)))
        tapGesture3.numberOfTapsRequired = 1
        languageMenuListView.textLabel3.addGestureRecognizer(tapGesture3)
        
        let tapGestureSettingsLabel1 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.myFirstSettingsLabelViewTapped(_:)))
        tapGestureSettingsLabel1.numberOfTapsRequired = 1
        settingsListView.textLabel1.addGestureRecognizer(tapGestureSettingsLabel1)
        
        let tapGestureSettingsLabel2 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.mySecondSettingsLabelViewTapped(_:)))
        tapGestureSettingsLabel2.numberOfTapsRequired = 1
        settingsListView.textLabel2.addGestureRecognizer(tapGestureSettingsLabel2)
        configureNavbar()
        addToolBar()
    }
    
    // Label taps funcitons   "Тоҷики-Руси"
    @objc func myFirstLabelViewTapped(_ sender: UITapGestureRecognizer) {
        navigationItem.title = changeTheTitleName(languageMenuListView.textLabel1.text!)
        languageMenuListView.isHidden = true
        isLanguageMenuOpened = false
        
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
        words.removeAll()
        words = SQLiteCommands.presentRows(id: 1)
        discoverTable.reloadData()
        dictionaryType = 1
        searchController.searchBar.text = ""
    }
    // "Tоҷики-Тоҷики"
    @objc func mySecondLabelViewTapped(_ sender: UITapGestureRecognizer) {
        navigationItem.title = changeTheTitleName(languageMenuListView.textLabel2.text!)
        languageMenuListView.isHidden = true
        isLanguageMenuOpened = false
        
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
        words.removeAll()
        words = SQLiteCommands.presentRows(id: 2)
        discoverTable.reloadData()
        dictionaryType = 2
        searchController.searchBar.text = ""
    }
    // "Руси-Тоҷики"
    @objc func myThirdLabelViewTapped(_ sender: UITapGestureRecognizer) {
        navigationItem.title = changeTheTitleName(languageMenuListView.textLabel3.text!)
        languageMenuListView.isHidden = true
        isLanguageMenuOpened = false
        
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
        words.removeAll()
        words = SQLiteCommands.presentRows(id: 3)
        discoverTable.reloadData()
        dictionaryType = 3
        searchController.searchBar.text = ""
    }
    // "Таърихи Ҷустуҷӯ"
    @objc func myFirstSettingsLabelViewTapped(_ sender: UITapGestureRecognizer) {
        let searchHistoryViewController = SearchHistoryViewController()
        self.navigationController?.pushViewController(searchHistoryViewController, animated: true)
        settingsListView.isHidden = true
        isSettingsOpened = false
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
    }
    // "Дар Бораи Барнома"
    @objc func mySecondSettingsLabelViewTapped(_ sender: UITapGestureRecognizer) {
        settingsListView.isHidden = true
        isSettingsOpened = false
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
        
        if(deviceIdiom == .pad) {
            let appDescriptionViewController = AppDescriptionViewController()
            self.showDetailViewController(UINavigationController(rootViewController: appDescriptionViewController), sender: nil)
        } else {
            let appDescriptionViewController = AppDescriptionViewController()
            self.navigationController?.pushViewController(appDescriptionViewController, animated: true)
        }
    }
    
    func changeTheTitleName(_ title: String) -> String {
        return title
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    
    // Navigation bar
    func configureNavbar() {
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.tintColor = UIColor.label
        } else {
            navigationController?.navigationBar.tintColor = UIColor.black
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings_icon"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(rightHandAction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "globe_icon"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(leftHandAction))
    }
    
    @objc
    func rightHandAction() {
        let navbarheight = navigationController?.navigationBar.frame.height ?? 40
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        navigationController?.view.addSubview(settingsListView)
        settingsListView.topAnchor.constraint(equalTo: view.topAnchor, constant: navbarheight + statusBarHeight).isActive = true
        settingsListView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        settingsListView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        settingsListView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        searchController.searchBar.isUserInteractionEnabled = false
        
        if(isLanguageMenuOpened == false) {
            if(isSettingsOpened == false) {
                settingsListView.isHidden = false
                isSettingsOpened = true
                searchController.searchBar.isUserInteractionEnabled = false
            } else if(isSettingsOpened == true) {
                settingsListView.isHidden = true
                isSettingsOpened = false
                view.isUserInteractionEnabled = true
                searchController.searchBar.isUserInteractionEnabled = true
            }
        } else if (isLanguageMenuOpened == true){
            languageMenuListView.isHidden = true
            settingsListView.isHidden = false
            isSettingsOpened = true
            isLanguageMenuOpened = false
        }
    }
    
    @objc
    func leftHandAction() {
        let navbarheight = navigationController?.navigationBar.frame.height ?? 40
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        navigationController?.view.addSubview(languageMenuListView)
        languageMenuListView.topAnchor.constraint(equalTo: view.topAnchor, constant: navbarheight + statusBarHeight).isActive = true
        languageMenuListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        languageMenuListView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        languageMenuListView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        searchController.searchBar.isUserInteractionEnabled = false
        
        if(isSettingsOpened == false) {
            if(isLanguageMenuOpened == false) {
                languageMenuListView.isHidden = false
                isLanguageMenuOpened = true
                searchController.searchBar.isUserInteractionEnabled = false
            } else if(isLanguageMenuOpened == true) {
                languageMenuListView.isHidden = true
                isLanguageMenuOpened = false
                view.isUserInteractionEnabled = true
                searchController.searchBar.isUserInteractionEnabled = true
            }
        } else if(isSettingsOpened == true) {
            settingsListView.isHidden = true
            languageMenuListView.isHidden = false
            isSettingsOpened = false
            isLanguageMenuOpened = true
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionUITableViewCell.identifies, for: indexPath) as! DescriptionUITableViewCell
        cell.configure(word: words[indexPath.row])
        cell.contentView.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (languageMenuListView.isHidden == true && settingsListView.isHidden == true) {
            var wordDescriptionViewController = WordDescriptionViewController()
            
            if(deviceIdiom == .pad) {
                wordDescriptionViewController = WordDescriptionViewController()
                wordDescriptionViewController.configure(word: words[indexPath.row])
                self.showDetailViewController(UINavigationController(rootViewController: wordDescriptionViewController), sender: nil)
            } else {
                wordDescriptionViewController = WordDescriptionViewController()
                wordDescriptionViewController.configure(word: words[indexPath.row])
                self.navigationController?.pushViewController(wordDescriptionViewController, animated: true)
            }
            SQLiteCommands.insertRow(words[indexPath.row])
        } else {
            languageMenuListView.isHidden = true
            settingsListView.isHidden = true
            searchController.searchBar.isUserInteractionEnabled = true
            isSettingsOpened = true
            isLanguageMenuOpened = true
        }
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let term = searchController.searchBar.text {
            filterRowsForSearchedText(term)
        }
        guard searchController.searchBar.text != nil else {return}
    }
}

