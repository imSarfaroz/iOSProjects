//
//  ViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit

//public var titleName:String = "Руси-Тоҷики"

@available(iOS 14.0, *)
class MainViewController: UIViewController, UISearchResultsUpdating {
    

    
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
    
    let barButtonMenu = UIMenu(title: "", children: [
        UIAction(title: NSLocalizedString("Руси-Тоҷики", comment: ""), handler : {action in
            print(action.title)
            //titleName = action.title
        }),
        UIAction(title: NSLocalizedString("Тоҷики-Руси", comment: ""), handler: {action in
            print(action.title)
            //titleName = action.title
        }),
        UIAction(title: NSLocalizedString("Тоҷики-Тоҷики", comment: ""), handler: {action in
            print(action.title)
            //titleName = action.title
        }),
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = false
        self.definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "Руси-Тоҷики"
        
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "globe"), primaryAction: nil, menu: barButtonMenu)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "book"), primaryAction: nil, menu: nil)

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        
        print(text)
    }
    
    
    func changeTheTitleName(_ title: String) -> String {
        return title
    }
}

@available(iOS 14.0, *)
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
        
        let newViewController = NewViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
