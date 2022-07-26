//
//  TableViewCell.swift
//  Farhang
//
//  Created by Sarfaroz on 7/14/22.
//

import UIKit

class DescriptionUITableViewCell: UITableViewCell {
    static let identifies = "DescriptionUITableViewCell"
    
    private let word: UILabel = {
        let word = UILabel()
        word.textColor = .black
        word.translatesAutoresizingMaskIntoConstraints = false
        word.font = UIFont(name: "HelveticaNeue", size: 18)
        return word
    }()
    
    private let wordDescription: UILabel = {
        let wordDescription = UILabel()
        wordDescription.textColor = .black
        wordDescription.translatesAutoresizingMaskIntoConstraints = false
        wordDescription.lineBreakMode = .byTruncatingTail
        wordDescription.numberOfLines = 1;
        wordDescription.font = UIFont(name: "HelveticaNeue", size: 12)
        return wordDescription
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(word)
        contentView.addSubview(wordDescription)
        applyConstraints()
    }
    
    func applyConstraints() {
        let initial_word = [
            word.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            word.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
        ]
        let description_word = [
            wordDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            wordDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            wordDescription.topAnchor.constraint(equalTo: word.bottomAnchor, constant: 5),
        ]
        
        NSLayoutConstraint.activate(initial_word)
        NSLayoutConstraint.activate(description_word)
    }
    
    func configure(word: Dictionary) {
        self.word.text = word.word
        self.wordDescription.text = word.article
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
