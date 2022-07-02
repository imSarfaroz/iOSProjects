//
//  UpComingViewController.swift
//  Test UIKit
//
//  Created by Sarfaroz on 7/1/22.
//

import UIKit

class UpComingViewController: UIViewController {
    
    private let upcomingTable:UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
}

extension UpComingViewController: UITableViewDelegate, UITableViewDataSource {
    // number of cells in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // set the text
        cell.textLabel?.text = "test"
        return cell
    }
}
