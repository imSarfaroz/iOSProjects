//
//  WordDescriptionViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit

class AppDescriptionViewController: UIViewController {
    
    private let wordLabel: UILabel = {
       let wordLabel = UILabel()
        wordLabel.text = "Дар Бораи Барнома"
        wordLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    private let wordDescriptionLabel: UILabel = {
       let wordLabel = UILabel()
        wordLabel.text = "This is a lable for an app Description This is a lable for an app Description This is a lable for an app Description This is a lable for an app Description This is a lable for an app Description"
        wordLabel.numberOfLines = 0
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(wordLabel)
        view.addSubview(wordDescriptionLabel)
        applyConstraints()
        
        configureNavbar()
    }
    
    
    
    func configureNavbar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "info"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: nil)
    }
    
    func applyConstraints() {
        
        let wordText = [
            wordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/8),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.widthAnchor/2)
        ]
        
        let descriptionText = [
            wordDescriptionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 14),
            wordDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width/15),
            wordDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width/15)
        ]
        
        NSLayoutConstraint.activate(wordText)
        NSLayoutConstraint.activate(descriptionText)
    }
}
