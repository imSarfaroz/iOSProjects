//
//  TitlePreviewViewController.swift
//  Test UIKit
//
//  Created by Sarfaroz on 7/11/22.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    private let overViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0 // it can take muliply lines
        label.text = "This is the best moview to watch as a kid"
        return label
    }()
    
    private let downLoadButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("DownLoad", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let webVIew:WKWebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(downLoadButton)
        
        configureConstraints()
    }
    
    func configureConstraints() {
        let webViewConstraints = [
            webVIew.topAnchor.constraint(equalTo: view.topAnchor),
            webVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        let titleLabelConstaints = [
            titleLabel.topAnchor.constraint(equalTo: webVIew.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let overViewLabelConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstaints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
        
    }
}
