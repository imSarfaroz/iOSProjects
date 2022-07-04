//
//  CollectionViewUITableViewCell.swift
//  ChatApp
//
//  Created by Sarfaroz on 7/4/22.
//

import UIKit
import SDWebImage
import SwiftUI

class CollectionViewUITableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewUITableViewCell"
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20

        // need to be filled in module
        imageView.image = UIImage(systemName: "person")

        return imageView
    }()
    
    private let userReadView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // need to be filled in module
        imageView.image = UIImage(systemName: "checkmark")

        return imageView
    }()
    
    
    private let userTimeSentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .thin)
        label.text = "9:41 AM"
        
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Bob Thomas"
        return label
    }()
    
    private let userMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .thin)
        
        label.text = "This library provides an async..."
        return label

    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userMessageLabel)
        contentView.addSubview(userTimeSentLabel)
        contentView.addSubview(userReadView)
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        let imageConstraints = [
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 40),
        ]
        let nameConstraints = [
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        ]
        let messageConstraints = [
            userMessageLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userMessageLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor)
        ]
        
        let timeConstraints = [
            userTimeSentLabel.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor, constant: 60),
            userTimeSentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        ]
        
        let readConstraints = [
            userReadView.leadingAnchor.constraint(equalTo: userTimeSentLabel.trailingAnchor, constant: 22),
            userReadView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(messageConstraints)
        NSLayoutConstraint.activate(timeConstraints)
        NSLayoutConstraint.activate(readConstraints)
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

