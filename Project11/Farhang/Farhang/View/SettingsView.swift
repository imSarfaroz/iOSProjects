//
//  SettingsUIView.swift
//  Farhang
//
//  Created by Sarfaroz on 7/13/22.
//

import UIKit

class SettingsView: UIView {
    
    public let textLabel1: UILabel = {
        let textLabel1 = UILabel()
        textLabel1.text = "  Таърихи Ҷустуҷӯ"
        textLabel1.textColor = .black
        textLabel1.clipsToBounds = true
        if #available(iOS 11.0, *) {
            textLabel1.layer.cornerRadius = 10
            textLabel1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        textLabel1.layer.borderWidth = 0.1
        textLabel1.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel1.backgroundColor = .white
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        textLabel1.isUserInteractionEnabled = true
        return textLabel1
    }()
    
    public let textLabel2: UILabel = {
        let textLabel2 = UILabel()
        textLabel2.text = "  Дар Бораи Барнома"
        textLabel2.clipsToBounds = true
        textLabel2.textColor = .black
        if #available(iOS 11.0, *) {
            textLabel2.layer.cornerRadius = 10
            textLabel2.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        textLabel2.layer.borderWidth = 0.1
        textLabel2.layer.borderColor = UIColor(red:100/255, green:100/255, blue:100/255, alpha: 1).cgColor
        textLabel2.backgroundColor = .white
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        textLabel2.isUserInteractionEnabled = true
        return textLabel2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textLabel1)
        addSubview(textLabel2)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let text1 = [
            textLabel1.topAnchor.constraint(equalTo: topAnchor),
            textLabel1.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel1.widthAnchor.constraint(equalToConstant: 180),
            textLabel1.heightAnchor.constraint(equalToConstant: 45),
        ]
        
        let text2 = [
            textLabel2.topAnchor.constraint(equalTo: textLabel1.bottomAnchor),
            textLabel2.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel2.widthAnchor.constraint(equalToConstant: 180),
            textLabel2.heightAnchor.constraint(equalToConstant: 45),
        ]
        
        NSLayoutConstraint.activate(text1)
        NSLayoutConstraint.activate(text2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
