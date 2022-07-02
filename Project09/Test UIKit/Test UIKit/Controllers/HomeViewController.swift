//
//  HomeViewController.swift
//  Test UIKit
//
//  Created by Sarfaroz on 7/1/22.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrandingTV = 1
    case Popular = 2
    case TopRated = 3
    case UpcomingMovies = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitles:[String] = ["Trending Movies", "Trending TV", "Popular", "Top Rated", "Upcoming Movies"]
    
    private let homeFeedTable: UITableView = {
        // groups as adding headers, footer as etc.
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewUITableViewCell.self, forCellReuseIdentifier: CollectionViewUITableViewCell.identifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        // Two protocols so our viewTable could work properly
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        
        //fetchData()
    }
    
    func configureNavbar() {
        var image = UIImage(named:"netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "film"), style: .done, target: self, action: nil)
        
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        homeFeedTable.frame = view.bounds
    }

}

// The number of rows in a cell
extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewUITableViewCell.identifier, for: indexPath)
                as? CollectionViewUITableViewCell else {
                    return UITableViewCell()
                }
        
        switch indexPath.section {
            
        case Sections.TrendingMovies.rawValue:
            
            APICaller.shared.getTrendingMoview { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Sections.TrandingTV.rawValue:
            
                  APICaller.shared.getTrendingTvs { result in
                      switch result {
                      case .success(let titles):
                          cell.configure(with: titles)
                      case .failure(let error):
                          print(error.localizedDescription)
                      }
                  }
            
        case Sections.UpcomingMovies.rawValue:
                   
            APICaller.shared.getUpcomingMovies { result in
                       switch result {
                       case .success(let titles):
                           cell.configure(with: titles)
                       case .failure(let error):
                           print(error.localizedDescription)
                       }
                   }
                   
            
        case Sections.Popular.rawValue:
                APICaller.shared.getPopularMovies { result in
                       switch result {
                       case .success(let titles):
                           cell.configure(with: titles)
                       case .failure(let error):
                           print(error.localizedDescription)
                       }
                   }
        
        case Sections.TopRated.rawValue:
            APICaller.shared.getTopRatedMovies { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error)
                }
            }
            
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100,
                                         height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}


// API address for free moview access!
// dc381316c407b0487fc5cef07e718023
