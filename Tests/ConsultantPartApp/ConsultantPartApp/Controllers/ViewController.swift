//
//  ViewController.swift
//  ConsultantPartApp
//
//  Created by Sarfaroz on 7/6/22.
//

import UIKit
class ViewController: UIViewController{
    
    var isTextFieldEmpty:Bool = true
    
    private let startChatButton: UIButton = {
        let button = UIButton()
        button.setTitle("НАЧАТЬ ДИАЛОГ", for: .normal)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        
        return button
    }()
    
    let chatTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "     Сообщение"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.layer.cornerRadius = 20
        textField.isHidden = true
        
        let imageView = UIImageView()
        let image = UIImage(systemName: "paperclip", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        imageView.image = image
        imageView.tintColor = UIColor.systemGreen
        textField.rightView = imageView
        textField.rightViewMode = UITextField.ViewMode.always
        
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
        //  title = "Консультант"
        
        view.addSubview(startChatButton)
        view.addSubview(chatTextField)
        view.addSubview(chatTableView)
        
        chatTableView.bottomAnchor.constraint(equalTo: startChatButton.topAnchor, constant: -10).isActive = true
        chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        chatTableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        chatTableView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        startChatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        startChatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        startChatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        startChatButton.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
        startChatButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        startChatButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        chatTextField.addTarget(self, action: #selector(changeIconOnTextField), for: .editingChanged)
        
        configureNavbar()
    }
    
    @objc func changeIconOnTextField() {
        if(chatTextField.text!.count > 0) {
            let imageView = UIImageView()
            let image = UIImage(systemName: "paperplane.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
            imageView.image = image
            imageView.tintColor = UIColor.systemGreen
            chatTextField.rightView = imageView
        } else {
            let imageView = UIImageView()
            let image = UIImage(systemName: "paperclip", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
            imageView.image = image
            imageView.tintColor = UIColor.systemGreen
            chatTextField.rightView = imageView
        }
    }
    
    
    @objc func onChange() {
        print(chatTextField.text?.count ?? 0)
    }
    
    func configureNavbar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "ellipsis"), primaryAction: nil, menu: barButtonMenu)
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: nil, image: UIImage(systemName: "arrow.backward"), primaryAction: nil, menu: nil),
            UIBarButtonItem(title: "Консультант", style: .done, target: self, action: nil)
        ]
    }
    
    let barButtonMenu = UIMenu(title: "", children: [
        UIAction(title: NSLocalizedString("Очистить Историю Чата", comment: ""), image: UIImage(systemName: "gobackward"), handler : {action in
            print(action.title)
        }),
        UIAction(title: NSLocalizedString("Закрыть Чат", comment: ""), image: UIImage(systemName: "xmark")?.withTintColor(.red, renderingMode: .alwaysOriginal), handler: {action in
            print(action.title)
        }),
    ])
    
    @objc func tapped() {
        startChatButton.isHidden = true
        chatTextField.isHidden = false
        chatTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        chatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        chatTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        chatTextField.widthAnchor.constraint(equalToConstant: 40).isActive = true
        chatTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewUITableViewCell.identifier, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 150, y: 0, width: headerView.frame.width-40, height: headerView.frame.height-40)
        label.text = "06 июля 2022"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor.systemGreen
        headerView.addSubview(label)
        
        return headerView
    }
    
    
}
