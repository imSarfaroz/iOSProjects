//
//  ViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit

class MainViewController: UIViewController, UISearchResultsUpdating {
    
    var isMenuOpened:Bool = false
    var isSettingsOpened:Bool = false
    
    private let discoverTable: UITableView = {
        let table = UITableView()
        table.register(DescriptionUITableViewCell.self, forCellReuseIdentifier: DescriptionUITableViewCell.identifies)
        return table
    }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Калимаро ворид кунед..."
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    let menuListView: MenuListView = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = changeTheTitleName("Руси-Тоҷики")
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        // TAP Gestures
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
    
    @objc func myFirstLabelViewTapped(_ sender: UITapGestureRecognizer) {
        print("tap 1st label working")
        navigationItem.title = changeTheTitleName(menuListView.textLabel1.text!)
        menuListView.isHidden = true
        isMenuOpened = false
        
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
    }
    
    @objc func mySecondLabelViewTapped(_ sender: UITapGestureRecognizer) {
        
        print("tap 2nd label working")
        //        changeTheTitleName(menuListView.textLabel2.text!)
        navigationItem.title = changeTheTitleName(menuListView.textLabel2.text!)
        menuListView.isHidden = true
        isMenuOpened = false
        
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
    }
    
    @objc func myThirdLabelViewTapped(_ sender: UITapGestureRecognizer) {
        print("tap 3rd label working")
        navigationItem.title = changeTheTitleName(menuListView.textLabel3.text!)
        menuListView.isHidden = true
        isMenuOpened = false
        
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
    }
    
    @objc func myFirstSettingsLabelViewTapped(_ sender: UITapGestureRecognizer) {
        print("tap 1st Setigns label working")
        let searchHistoryViewController = SearchHistoryViewController()
        self.navigationController?.pushViewController(searchHistoryViewController, animated: true)
        settingsListView.isHidden = true
        isSettingsOpened = false
        
        view.isUserInteractionEnabled = true
        searchController.searchBar.isUserInteractionEnabled = true
    }
    
    @objc func mySecondSettingsLabelViewTapped(_ sender: UITapGestureRecognizer) {
        print("tap 2nd Setigns label working")
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
    
    func configureNavbar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings_icon"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(rightHandAction))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-globe-60"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(leftHandAction))
    }
    
    @objc
    func rightHandAction() {
        navigationController?.view.addSubview(settingsListView)
        //view.addSubview(settingsListView)
        settingsListView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/10).isActive = true
        settingsListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 2.3).isActive = true
        settingsListView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        settingsListView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        print("right bar button action")
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
        navigationController?.view.addSubview(menuListView)
        //view.addSubview(menuListView)
        menuListView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/10).isActive = true
        menuListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 12).isActive = true
        menuListView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        menuListView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        print("left bar button action")
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
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        
        print(text)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionUITableViewCell.identifies, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        menuListView.isHidden = true
        settingsListView.isHidden = true
        
        let wordDescriptionViewController = WordDescriptionViewController()
        self.navigationController?.pushViewController(wordDescriptionViewController, animated: true)
    }
    
    
}
