//
//  AuthorizationViewController.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 21.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit

final class AuthorizationStackView: UIViewController {
    
    private let mainStackView = UIStackView(arrangedSubviews: [])
    private let loginStackView = UIStackView(arrangedSubviews: [])
    private let passwordStackView = UIStackView(arrangedSubviews: [])
    
    private var usernameLable: UILabel = {
        let lable = UILabel()
        lable.text = "Login"
        lable.font = UIFont.systemFont(ofSize: 17)
        return lable
    }()
    
    private var passwordLable: UILabel = {
        let lable = UILabel()
        lable.text = "Password"
        lable.font = UIFont.systemFont(ofSize: 17)
        return lable
    }()
    
    private var usernameTextField: UITextField = {
        let textField = UITextField()
        //        textField.text = "Login"
        textField.borderStyle = .roundedRect
        //        textField.font = UIFont.systemFont(ofSize: 15)
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        //        usernameTextField.text = "Login"
        textField.borderStyle = .roundedRect
        //        usernameTextField.font = UIFont.systemFont(ofSize: 15)
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return textField
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemYellow
        button.setTitle("Tap to login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(tappedForLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainStackView)
        setMainStackView()
    }
    
    func setMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .equalCentering
        mainStackView.spacing = 10
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let insets = UIEdgeInsets(top: 130, left: 30, bottom: 10, right: 30)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = insets
        
        setLoginStackView()
        setPasswordStackView()
        mainStackView.addArrangedSubview(loginStackView)
        mainStackView.addArrangedSubview(passwordStackView)
        mainStackView.addArrangedSubview(loginButton)
    }
    
    private func setLoginStackView() {
        loginStackView.axis = .vertical
        loginStackView.alignment = .fill
        loginStackView.distribution = .equalCentering
        loginStackView.spacing = 8
        
        loginStackView.addArrangedSubview(usernameLable)
        loginStackView.addArrangedSubview(usernameTextField)
    }
    
    private func setPasswordStackView() {
        passwordStackView.axis = .vertical
        passwordStackView.alignment = .fill
        passwordStackView.distribution = .equalCentering
        passwordStackView.spacing = 8
        
        passwordStackView.addArrangedSubview(passwordLable)
        passwordStackView.addArrangedSubview(passwordTextField)
    }
    
    @objc private func tappedForLogin(sender: UIButton) {
        performSegue(withIdentifier: "NewPersonsCollectionVC", sender: nil)
    }
    
}
