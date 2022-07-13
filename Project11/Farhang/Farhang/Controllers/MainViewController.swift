//
//  ViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit

public var titleName:String = "Руси-Тоҷики"

class MainViewController: UIViewController, UISearchResultsUpdating {
    
    var isMenuOpened:Bool = false
    
    private let discoverTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        navigationItem.title = titleName
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
        //        view.addSubview(menuListView)
        //        view.addSubview((settingsListView))
//        navigationController?.view.addSubview(menuListView)
        navigationController?.view.addSubview(settingsListView)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
//        menuListView.addGestureRecognizer(tap)
        
            // TAP Gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.myviewTapped(_:)))
            tapGesture.numberOfTapsRequired = 1
            menuListView.addGestureRecognizer(tapGesture)
            menuListView.isUserInteractionEnabled = true
        
        configureNavbar()
    }
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {

        print("tap working")
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
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
        view.addSubview(settingsListView)
        settingsListView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        settingsListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200).isActive = true
        settingsListView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        settingsListView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        print("right bar button action")
        if(isMenuOpened == false) {
            settingsListView.isHidden = false
            isMenuOpened = true
            view.isUserInteractionEnabled = false
            searchController.searchBar.isUserInteractionEnabled = false
        } else if(isMenuOpened == true) {
            settingsListView.isHidden = true
            isMenuOpened = false
            view.isUserInteractionEnabled = true
            searchController.searchBar.isUserInteractionEnabled = true
        }
    }
    
    @objc
    func leftHandAction() {
        view.addSubview(menuListView)
        menuListView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        menuListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        menuListView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        menuListView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        print("left bar button action")
        if(isMenuOpened == false) {
            menuListView.isHidden = false
            isMenuOpened = true
//            view.isUserInteractionEnabled = false
//            searchController.searchBar.isUserInteractionEnabled = false
        } else if(isMenuOpened == true) {
            menuListView.isHidden = true
            isMenuOpened = false
//            view.isUserInteractionEnabled = true
//            searchController.searchBar.isUserInteractionEnabled = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "text sample"
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
