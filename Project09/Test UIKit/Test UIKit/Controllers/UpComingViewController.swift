//
//  UpComingViewController.swift
//  Test UIKit
//
//  Created by Sarfaroz on 7/1/22.
//

import UIKit

class UpComingViewController: UIViewController {
    
    private var titles: [Title] = [Title]()
    
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
        fetchUpcoming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    
    private func fetchUpcoming() {
        APICaller.shared.getUpcomingMovies{ [weak self] result in
            switch result {
            case.success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UpComingViewController: UITableViewDelegate, UITableViewDataSource {
    // number of cells in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // set the text
        cell.textLabel?.text = titles[indexPath.row].original_name ?? titles[indexPath.row].original_title ?? "Unknown"
        return cell
    }
}
