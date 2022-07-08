//
//  CollectionViewUITableViewCell.swift
//  ChatApp
//
//  Created by Sarfaroz on 7/4/22.
//

import UIKit
import SDWebImage

class MessageOperatorUITableViewCell: UITableViewCell {
    
    static let identifier = "MessageOperatorUITableViewCell"
    var indexx: Int!
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.tintColor = UIColor.white
        imageView.backgroundColor = UIColor.red
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
        label.text = "Jack eew"
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
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userImageView)
        contentView.addSubview(backView)
        backView.addSubview(userNameLabel)
        backView.addSubview(userMessageLabel)
        backView.addSubview(userTimeSentLabel)
        
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        let imageConstraints = [
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImageView.widthAnchor.constraint(equalToConstant: 30),
            userImageView.heightAnchor.constraint(equalToConstant: 30),
        ]
        let backViewConstraints = [
            backView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.6),
            backView.heightAnchor.constraint(equalToConstant: 50)
        ]
        let nameConstraints = [
            userNameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            userNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
        ]
        let messageConstraints = [
            userMessageLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userMessageLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            userMessageLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 2),
            userMessageLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: 2)
        ]
    
        let timeConstraints = [
            userTimeSentLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userTimeSentLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 140),
            userTimeSentLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 2),
            userTimeSentLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: 2)
        ]
        NSLayoutConstraint.activate(backViewConstraints)
        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(messageConstraints)
        NSLayoutConstraint.activate(timeConstraints)
    }
    
    func configure(indexx: Int) {
        userMessageLabel.text = "Hello \(indexx)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

