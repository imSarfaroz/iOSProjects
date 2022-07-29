//
//  MenuListView.swift
//  Farhang
//
//  Created by Sarfaroz on 7/13/22.
//

import UIKit

class MenuListView: UIView {
    
    public let textLabel1: UILabel = {
        let textLabel1 = UILabel()
        textLabel1.text = "  Тоҷики-Руси"
        textLabel1.textColor = .black
        textLabel1.layer.borderWidth = 0.15
        if #available(iOS 11.0, *) {
            textLabel1.clipsToBounds = true
            textLabel1.layer.cornerRadius = 10
            textLabel1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
        }
        textLabel1.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel1.backgroundColor = .white
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        textLabel1.isUserInteractionEnabled = true
        return textLabel1
    }()
    
    public let textLabel2: UILabel = {
        let textLabel2 = UILabel()
        textLabel2.text = "  Тоҷики-Тоҷики"
        textLabel2.textColor = .black
        textLabel2.clipsToBounds = true
        textLabel2.layer.cornerRadius = 1.0
        textLabel2.layer.borderWidth = 0.15
        textLabel2.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel2.backgroundColor = .white
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        textLabel2.isUserInteractionEnabled = true
        return textLabel2
    }()
    
    public let textLabel3: UILabel = {
        let textLabel3 = UILabel()
        textLabel3.text = "  Руси-Тоҷики"
        textLabel3.textColor = .black
        textLabel3.layer.borderWidth = 0.15
        if #available(iOS 11.0, *) {
            textLabel3.clipsToBounds = true
            textLabel3.layer.cornerRadius = 10
            textLabel3.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
        }
        
        textLabel3.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel3.backgroundColor = .white
        textLabel3.translatesAutoresizingMaskIntoConstraints = false
        textLabel3.isUserInteractionEnabled = true
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
            textLabel1.topAnchor.constraint(equalTo: topAnchor),
            textLabel1.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel1.widthAnchor.constraint(equalToConstant: 200),
            textLabel1.heightAnchor.constraint(equalToConstant: 45),
        ]
        let text2 = [
            textLabel2.topAnchor.constraint(equalTo: textLabel1.bottomAnchor),
            textLabel2.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel2.widthAnchor.constraint(equalToConstant: 200),
            textLabel2.heightAnchor.constraint(equalToConstant: 45),
        ]
        let text3 = [
            textLabel3.topAnchor.constraint(equalTo: textLabel2.bottomAnchor),
            textLabel3.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel3.widthAnchor.constraint(equalToConstant: 200),
            textLabel3.heightAnchor.constraint(equalToConstant: 45),
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
