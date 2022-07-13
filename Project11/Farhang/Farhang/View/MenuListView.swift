//
//  MenuListView.swift
//  Farhang
//
//  Created by Sarfaroz on 7/13/22.
//

import UIKit

class MenuListView: UIView {
    
    private let textLabel1: UILabel = {
        let textLabel1 = UILabel()
        textLabel1.text = "text1"
        textLabel1.textColor = .black
        textLabel1.clipsToBounds = true
        textLabel1.layer.cornerRadius = 10
        textLabel1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textLabel1.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel1.backgroundColor = .green
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        return textLabel1
    }()
    
    private let textLabel2: UILabel = {
        let textLabel2 = UILabel()
        textLabel2.text = "text2"
        textLabel2.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel2.backgroundColor = .green
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        return textLabel2
    }()
    
    private let textLabel3: UILabel = {
        let textLabel3 = UILabel()
        textLabel3.text = "text3"
        textLabel3.clipsToBounds = true
        textLabel3.layer.cornerRadius = 10
        textLabel3.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textLabel3.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel3.backgroundColor = .green
        textLabel3.translatesAutoresizingMaskIntoConstraints = false
        return textLabel3
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel1)
        addSubview(textLabel2)
        addSubview(textLabel3)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let text1 = [
            textLabel1.topAnchor.constraint(equalTo: topAnchor, constant: frame.height+100),
            textLabel1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            textLabel1.widthAnchor.constraint(equalToConstant: 200),
            textLabel1.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        let text2 = [
            textLabel2.topAnchor.constraint(equalTo: textLabel1.bottomAnchor),
            textLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            textLabel2.widthAnchor.constraint(equalToConstant: 200),
            textLabel2.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        let text3 = [
            textLabel3.topAnchor.constraint(equalTo: textLabel2.bottomAnchor),
            textLabel3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            textLabel3.widthAnchor.constraint(equalToConstant: 200),
            textLabel3.heightAnchor.constraint(equalToConstant: 40),
        ]
        
        NSLayoutConstraint.activate(text1)
        NSLayoutConstraint.activate(text2)
        NSLayoutConstraint.activate(text3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
