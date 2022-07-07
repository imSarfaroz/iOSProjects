import UIKit

class HeaderView: UIView {
    
    private let textFielld: UITextView = {
        let textFielld = UITextView()
        textFielld.text = "hi"
        textFielld.textColor = UIColor.green
        textFielld.layer.borderWidth = 1
        textFielld.translatesAutoresizingMaskIntoConstraints = false
        textFielld.layer.cornerRadius = 5
        return textFielld
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textFielld)
        applyContraints()
    }
    
    private func applyContraints() {
    
        let DownloadButtonConstraints = [
            textFielld.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            textFielld.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            textFielld.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(DownloadButtonConstraints)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
