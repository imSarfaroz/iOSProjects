//
//  ViewController.swift
//  ConsultantPartApp
//
//  Created by Sarfaroz on 7/6/22.
//

import UIKit
class ViewController: UIViewController{
    
    let chatTableView: UITableView = {
        let table = UITableView()
        table.register(MessageClientUITableViewCell.self, forCellReuseIdentifier: MessageClientUITableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(MessageOperatorUITableViewCell.self, forCellReuseIdentifier: MessageOperatorUITableViewCell.identifier)
        
        return table
    }()
    
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
        chatTableView.transform = CGAffineTransform (scaleX: 1,y: -1);
        chatTableView.separatorStyle = .none
        
        startChatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
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
        chatTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        chatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        chatTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        chatTextField.widthAnchor.constraint(equalToConstant: 40).isActive = true
        chatTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
//    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 190.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 202.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 185.0,
//            alpha: CGFloat(1.0)
//        )
//    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MessageClientUITableViewCell.identifier, for: indexPath) as! MessageClientUITableViewCell
            cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
            
            cell.configure(indexx: indexPath.row)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageOperatorUITableViewCell.identifier, for: indexPath) as! MessageOperatorUITableViewCell
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        cell.configure(indexx: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: -72))
        
        let label2 = UILabel()
        label2.text = "Диалог закрыт или время диалога вышло. Прошу заново начать диалог!"
        label2.numberOfLines = 0
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 12)
        label2.textColor = UIColor.systemGray
        
        let label = PaddingLabel()
        label.text = "06 июля 2022"
        label.padding(5, 5, 5, 5)
        label.backgroundColor = UIColor(red: 219/255, green: 255/255, blue: 229/255, alpha: 1.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 9
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(red: 50/255, green: 205/255, blue: 50/255, alpha: 1.0)
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(label)
        footerView.addSubview(label2)
        footerView.transform = CGAffineTransform (scaleX: 1,y: -1);
        
        let labelContraints = [
            label.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -130),
            label.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 150),
            label.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -150),
        ]
        
        let label2Contraints = [
            label2.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -100),
            label2.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 50),
            label2.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -50),
        ]
        
        NSLayoutConstraint.activate(labelContraints)
        NSLayoutConstraint.activate(label2Contraints)
        
        return footerView
    }
}

class PaddingLabel: UILabel {
    
    var insets = UIEdgeInsets.zero
    
    /// Добавляет отступы
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}
