//
//  SearchHistoryViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/14/22.
//

import UIKit

class SearchHistoryViewController: UIViewController {
    var words: [Dictionary]!
    var historyWords: [WordHistory]!
    
    private let searchHistoryTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SearchHistoryTableViewCell.self, forCellReuseIdentifier: SearchHistoryTableViewCell.identifies)
        table.rowHeight = 60
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchHistoryTable)
        searchHistoryTable.delegate = self
        searchHistoryTable.dataSource = self
        words = SQLiteCommands.presentHistoryRows()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchHistoryTable.frame = view.bounds
    }
}

extension SearchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryTableViewCell.identifies, for: indexPath) as! SearchHistoryTableViewCell
        cell.configure(word: words[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let wordDescriptionViewController = WordDescriptionViewController()
        wordDescriptionViewController.configure(word: words[indexPath.row])
        self.navigationController?.pushViewController(wordDescriptionViewController, animated: true)
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
