//
//  SearchHistoryViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/14/22.
//

import UIKit

class SearchHistoryViewController: UIViewController {
    
    private let searchHistoryTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(DescriptionUITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchHistoryTable)
        searchHistoryTable.delegate = self
        searchHistoryTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchHistoryTable.frame = view.bounds
    }
}

extension SearchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "search history words sample"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 2, width: 320, height: 40)
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myLabel.text = "Таърихи Ҷустуҷӯ"

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
    }
    
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
}
