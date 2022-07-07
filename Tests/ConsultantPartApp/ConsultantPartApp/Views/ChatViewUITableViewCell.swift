//
//  CollectionViewUITableViewCell.swift
//  ChatApp
//
//  Created by Sarfaroz on 7/4/22.
//

import UIKit
import SDWebImage

class CollectionViewUITableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewUITableViewCell"
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.tintColor = UIColor.white
        imageView.backgroundColor = UIColor.systemGreen
        // need to be filled in module
        imageView.image = UIImage(systemName: "headphones")

        return imageView
    }()

    private let userTimeSentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.text = "9:41 AM"

        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.text = "Jack"
        label.textColor = UIColor.systemBlue
        return label
    }()
    
    private let userMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.black
        label.text = "This library provides an async ..."
        return label

    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userMessageLabel)
        contentView.addSubview(userTimeSentLabel)
        

        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        let imageConstraints = [
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.widthAnchor.constraint(equalToConstant: 30),
            userImageView.heightAnchor.constraint(equalToConstant: 30),
        ]
        let nameConstraints = [
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
        ]
        let messageConstraints = [
            userMessageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            userMessageLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10)
        ]
        
        let timeConstraints = [
            userTimeSentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 190),
            userTimeSentLabel.topAnchor.constraint(equalTo: userMessageLabel.topAnchor, constant: 30),
        ]

        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(messageConstraints)
        NSLayoutConstraint.activate(timeConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    public func configure(with model: String) {
//
//        guard let url = URL(string: "") else {
//            return
//        }
//
//        userImageView.sd_setImage(with: url, completed: nil)
//
//    }
}

