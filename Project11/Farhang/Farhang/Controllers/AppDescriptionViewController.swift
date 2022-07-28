//
//  WordDescriptionViewController.swift
//  Farhang
//
//  Created by Sarfaroz on 7/12/22.
//

import UIKit
class AppDescriptionViewController: UIViewController {
    private let wordLabel: UILabel = {
        let wordLabel = UILabel()
        wordLabel.text = "Дар Бораи Барнома"
        wordLabel.font = UIFont(name: "HelveticaNeue", size: 17)
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    private let wordDescriptionLabel: UILabel = {
        let wordLabel = UILabel()
        wordLabel.text = "Фарҳанг - луғати руси-тоҷики, тоҷики-руси ва тоҷики-тоҷики мебошад ки дорои 132400 калима аст. Луғат офлайн кор мекунад ва пайвасти интернетро талаб намекунад. Ин барнома барои истифода комилан ройгон аст. \n\n\nTаҳиякунанда: ширкати Abad Technologies (Душанбе, Тоҷикистон) \n\nПешниҳод ё савол доред? Паёми шуморо интизорем: info@abad.tj"
        wordLabel.numberOfLines = 0
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(wordLabel)
        view.addSubview(wordDescriptionLabel)
        applyConstraints()
        configureNavbar()
    }
    
    func configureNavbar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "info"),
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
    }
    
    func applyConstraints() {
        let wordText = [
            wordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/8),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let descriptionText = [
            wordDescriptionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 14),
            wordDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width/15),
            wordDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width/15)
        ]
        NSLayoutConstraint.activate(wordText)
        NSLayoutConstraint.activate(descriptionText)
    }
}
