//
//  ViewController.swift
//  ConsultantPartApp
//
//  Created by Sarfaroz on 7/6/22.
//

import UIKit

class ViewController: UIViewController{

    
    private let startChatButton: UIButton = {
        let button = UIButton()
        button.setTitle("НАЧАТЬ ДИАЛОГ", for: .normal)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "     Сообщение"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        //        textField.rightViewMode = UITextField.ViewMode.always
        //        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //        button.setImage(UIImage(named: "paperclip"), for: .normal)
        //        button.tintColor = UIColor.systemGreen
        //        textField.rightView = button
        
        textField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "paperclip")
        imageView.image = image
        imageView.tintColor = UIColor.systemGreen
        textField.rightView = imageView
        textField.isHidden = true
        
        return textField
    }()
    
    let chatTableView: UITableView = {
        let table = UITableView()
        table.register(CollectionViewUITableViewCell.self, forCellReuseIdentifier: CollectionViewUITableViewCell.identifier)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(startChatButton)
        view.addSubview(textField)
        
        view.addSubview(chatTableView)
        chatTableView.bottomAnchor.constraint(equalTo: startChatButton.topAnchor, constant: -10).isActive = true
        chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        chatTableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        chatTableView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        chatTableView.delegate = self
        chatTableView.dataSource = self

        startChatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        startChatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        startChatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        startChatButton.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        startChatButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startChatButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc func tapped() {
        startChatButton.isHidden = true
        textField.isHidden = false
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // number of cells in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewUITableViewCell.identifier, for: indexPath)
        
        // set the text
//        cell.textLabel?.text = "test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}
