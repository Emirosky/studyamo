//
//  ViewController.swift
//  Studyamo
//
//  Created by Emir Fabio Cognigni on 19/01/23.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    let usernameTextField : UITextField = GetTextField(placeholder: "Username")
    let passwordTextField : UITextField = GetTextField(placeholder: "Password")
    let loginButton : UIButton = GetLoginButton()
    let container : UIStackView  = GetContainer()
    let titleLabel : UILabel = GetTitle()
    let descriptionLabel : UILabel = GetDescription()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        container.addArrangedSubview(usernameTextField)
        container.addArrangedSubview(passwordTextField)
        container.addArrangedSubview(loginButton)
        

        view.addSubview(container)
        
        let constraints : [NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            descriptionLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            container.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    static func GetTitle() -> UILabel{
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Benvenuto su \nStudyamo"
        title.textAlignment = .left
        title.numberOfLines = .zero
        title.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return title
    }
    
    static func GetDescription() -> UILabel{
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L'app dove trovare compagni di studio"
        label.numberOfLines = .zero
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = UIColor.secondaryLabel
        
        return label
    }
    
    
    static func GetTextField(placeholder: String) -> TextFieldWithPadding{
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.autocorrectionType = .no
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        
        textField.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        if placeholder == "Password"{
            textField.isSecureTextEntry = true
        }
        
        textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: 48))
        
        return textField
    }
    
    static func GetLoginButton() -> UIButton{
        var config = UIButton.Configuration.filled()
        
        config.title = "Confirm"
        
        let button = UIButton(configuration: config)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addConstraint(button.heightAnchor.constraint(equalToConstant: 48))
        return button
    }
    
    static func GetContainer() -> UIStackView{
        let container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .vertical
        container.distribution = .fill
        container.alignment = .fill
        container.spacing = 20
        
        return container
    }
    
    
    class TextFieldWithPadding: UITextField {

        let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)

        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    }
}

