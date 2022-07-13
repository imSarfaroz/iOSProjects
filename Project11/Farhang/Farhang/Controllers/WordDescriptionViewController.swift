//
//  WordDescriptionViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit

class WordDescriptionViewController: UIViewController {
    
    private let wordLabel: UILabel = {
       let wordLabel = UILabel()
        wordLabel.text = "Sample Text"
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    private let wordDescriptionLabel: UILabel = {
       let wordLabel = UILabel()
        wordLabel.text = "Sample Text description of the text"
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
            wordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        
        let descriptionText = [
            wordDescriptionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 40),
            wordDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            wordDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(wordText)
        NSLayoutConstraint.activate(descriptionText)
    }
}
