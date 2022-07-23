//
//  ViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit
import SQLite

class MainViewController: UIViewController {
    
    var isMenuOpened:Bool = false
    var isSettingsOpened:Bool = false
    
    var filteredSearchDictionary = [Dictionary]()
    var dictionaryType:Int = 1
    
    // Main tableView
    private let discoverTable: UITableView = {
        let table = UITableView()
        table.register(DescriptionUITableViewCell.self, forCellReuseIdentifier: DescriptionUITableViewCell.identifies)
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
        
        //items
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action:nil)
        let letterButton1 = UIBarButtonItem(title: "Ҳ", style: .done, target: self, action:  #selector(changeTheLetter1))
        letterButton1.width = view.bounds.size.width / 6
        let letterButton2 = UIBarButtonItem(title: "Ӯ", style: .done, target: self, action: #selector(changeTheLetter2))
        letterButton2.width = view.bounds.size.width / 6
        let letterButton3 = UIBarButtonItem(title: "Ғ", style: .done, target: self, action: #selector(changeTheLetter3))
        letterButton3.width = view.bounds.size.width / 6
        let letterButton4 = UIBarButtonItem(title: "Ҷ", style: .done, target: self, action: #selector(changeTheLetter4))
        letterButton4.width = view.bounds.size.width / 6
        let letterButton5 = UIBarButtonItem(title: "Қ", style: .done, target: self, action: #selector(changeTheLetter5))
        letterButton5.width = view.bounds.size.width / 6
        let letterButton6 = UIBarButtonItem(title: "Й", style: .done, target: self, action: #selector(changeTheLetter6))
        letterButton6.width = view.bounds.size.width / 6
        toolBar.items = [flexibleSpace, letterButton1, letterButton2, letterButton3, letterButton4, letterButton5, letterButton6]
        toolBar.tintColor = .black
        toolBar.barStyle = .default
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
    
    let menuListView: MenuListView = {
        let view = MenuListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let settingsListView: SettingsView = {
        let view = SettingsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    var words: [Dictionary] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        words = SQLiteCommands.presentRows(id: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        navigationItem.title = changeTheTitleName("Тоҷики-Руси")
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        addToolBar()
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            discoverTable.tableHeaderView = searchController.searchBar
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.dimsBackgroundDuringPresentation = false
            definesPresentationContext = true
        }
        
        searchController.searchResultsUpdater = self
       
        // Tap gestures
        let tapGestureLabel1 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.myFirstLabelViewTapped(_:)))
        tapGestureLabel1.numberOfTapsRequired = 1
        menuListView.textLabel1.addGestureRecognizer(tapGestureLabel1)

        let tapGestureLabel2 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.mySecondLabelViewTapped(_:)))
        tapGestureLabel2.numberOfTapsRequired = 1
        menuListView.textLabel2.addGestureRecognizer(tapGestureLabel2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.myThirdLabelViewTapped(_:)))
        tapGesture3.numberOfTapsRequired = 1
        menuListView.textLabel3.addGestureRecognizer(tapGesture3)
        
        let tapGestureSettingsLabel1 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.myFirstSettingsLabelViewTapped(_:)))
        tapGestureSettingsLabel1.numberOfTapsRequired = 1
        settingsListView.textLabel1.addGestureRecognizer(tapGestureSettingsLabel1)
        
        let tapGestureSettingsLabel2 = UITapGestureRecognizer(target: self, action: #selector(MainViewController.mySecondSettingsLabelViewTapped(_:)))
        tapGestureSettingsLabel2.numberOfTapsRequired = 1
        settingsListView.textLabel2.addGestureRecognizer(tapGestureSettingsLabel2)
        
        configureNavbar()
    }
    
    // Label taps funcitons   "Тоҷики-Руси"
    @objc func myFirstLabelViewTapped(_ sender: UITapGestureRecognizer) {
        navigationItem.title = changeTheTitleName(menuListView.textLabel1.text!)
        menuListView.isHidden = true
        isMenuOpened = false
        
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
        navigationItem.title = changeTheTitleName(menuListView.textLabel2.text!)
        menuListView.isHidden = true
        isMenuOpened = false
        
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
        navigationItem.title = changeTheTitleName(menuListView.textLabel3.text!)
        menuListView.isHidden = true
        isMenuOpened = false
        
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
        let appDescriptionViewController = AppDescriptionViewController()
        self.navigationController?.pushViewController(appDescriptionViewController, animated: true)
        settingsListView.isHidden = true
        isSettingsOpened = false
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
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
        navigationController?.navigationBar.tintColor = .black
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
        
        if(isMenuOpened == false) {
            if(isSettingsOpened == false) {
                settingsListView.isHidden = false
                isSettingsOpened = true
                view.isUserInteractionEnabled = false
                searchController.searchBar.isUserInteractionEnabled = false
            } else if(isSettingsOpened == true) {
                settingsListView.isHidden = true
                isSettingsOpened = false
                view.isUserInteractionEnabled = true
                searchController.searchBar.isUserInteractionEnabled = true
            }
        }
    }
    
    @objc
    func leftHandAction() {
        
        let navbarheight = navigationController?.navigationBar.frame.height ?? 40
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        navigationController?.view.addSubview(menuListView)
        menuListView.topAnchor.constraint(equalTo: view.topAnchor, constant: navbarheight + statusBarHeight).isActive = true
        menuListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        menuListView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        menuListView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        if(isSettingsOpened == false) {
            if(isMenuOpened == false) {
                menuListView.isHidden = false
                isMenuOpened = true
                view.isUserInteractionEnabled = false
                searchController.searchBar.isUserInteractionEnabled = false
            } else if(isMenuOpened == true) {
                menuListView.isHidden = true
                isMenuOpened = false
                view.isUserInteractionEnabled = true
                searchController.searchBar.isUserInteractionEnabled = true
            }
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        menuListView.isHidden = true
        settingsListView.isHidden = true
        let wordDescriptionViewController = WordDescriptionViewController()
        wordDescriptionViewController.configure(word: words[indexPath.row])
        self.navigationController?.pushViewController(wordDescriptionViewController, animated: true)
        
        SQLiteCommands.insertRow(words[indexPath.row])
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


