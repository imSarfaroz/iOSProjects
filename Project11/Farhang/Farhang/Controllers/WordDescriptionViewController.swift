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
       // wordLabel.text = "Sample Text"
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    private let wordDescriptionLabel: UILabel = {
       let wordLabel = UILabel()
       // wordLabel.text = "Sample Text description of the text Sample Text description of the text Sample Text description of the text Sample Text description of the text Sample Text description of the text"
        wordLabel.numberOfLines = 0;
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(wordLabel)
        view.addSubview(wordDescriptionLabel)
        applyConstraints()

    }
    
    func applyConstraints() {
        
        let wordText = [
            wordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/8),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let descriptionText = [
            wordDescriptionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 14),
            wordDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width/15),
            wordDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width/15)
        ]
        
        NSLayoutConstraint.activate(wordText)
        NSLayoutConstraint.activate(descriptionText)
    }
    
    func configure(word: Dictionary) {
        self.wordLabel.text = word.word
        self.wordDescriptionLabel.text = word.article
    }
}
