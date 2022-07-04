////
////  CollectionViewUITableViewCell.swift
////  ChatApp
////
////  Created by Sarfaroz on 7/4/22.
////
//
 
import UIKit
import SDWebImage
import SwiftUI

class CollectionViewUITableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewUITableViewCell"
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 20
//        imageView.layer.masksToBounds = true

        // need to be filled in module
        imageView.image = UIImage(systemName: "person")

        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.text = "Bob Thomas"
        return label
    }()
    
    private let userMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 19, weight: .regular)
//        label.numberOfLines = 0
        label.text = "Hello"
        return label

    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userMessageLabel)
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        let imageConstraints = [
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 40),
        ]
        let nameConstraints = [
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
        ]
        let messageConstraints = [
            userMessageLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userMessageLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor)
        ]
        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(messageConstraints)
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

