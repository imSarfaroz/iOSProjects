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
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    let menuListView: MenuListView = {
        let view = MenuListView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
//        view.layer.cornerRadius = 10
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
    
        //view.addSubview(menuListView)
        navigationController?.view.addSubview(menuListView)
        navigationItem.searchController = searchController
        self.searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
                                                       
        configureNavbar()
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
        print("right bar button action")
        
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @objc
    func leftHandAction() {
        print("left bar button action")
        if(isMenuOpened == false) {
        menuListView.isHidden = false
            isMenuOpened = true
        } else if(isMenuOpened == true) {
            menuListView.isHidden = true
            isMenuOpened = false
        }
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        
        print(text)
    }
    
//    func changeTheTitleName(_ title: String) -> String {
//        return title
//    }
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
        
        let wordDescriptionViewController = WordDescriptionViewController()
        self.navigationController?.pushViewController(wordDescriptionViewController, animated: true)
    }
}
