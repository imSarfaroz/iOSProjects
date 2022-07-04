//
//  ViewController.swift
//  ChatApp
//
//  Created by Sarfaroz on 7/4/22.
//

import UIKit

class ViewController: UIViewController {
        
        private let homeTable: UITableView = {
            let table = UITableView()
            table.register(CollectionViewUITableViewCell.self, forCellReuseIdentifier: CollectionViewUITableViewCell.identifier)
            table.translatesAutoresizingMaskIntoConstraints = false
            return table
        }()
    
    let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Звонки", "Чат"])
        segment.selectedSegmentIndex = 1
        segment.tintColor = .green
        segment.selectedSegmentTintColor = UIColor.systemGreen
        return segment
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.titleView = segmentControl
        configureNavigationBar()
        view.addSubview(homeTable)
        homeTable.delegate = self
        homeTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTable.frame = view.bounds
        
    }
    
    func configureNavigationBar() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.fill.badge.plus"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = UIColor.systemGreen
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewUITableViewCell.identifier, for: indexPath)
                as? CollectionViewUITableViewCell else { return UITableViewCell() }
    
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ChatViewController()
        vc.title = "Bob Thomas"
        navigationController?.pushViewController(vc ,animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 34, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y - 20, width: 100,
                                         height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        
        header.textLabel?.textColor = .black
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Чат"
    }
    
}

