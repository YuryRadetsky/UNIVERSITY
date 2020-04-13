//
//  ViewController.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 08.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit

class Authorization: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    @IBAction func usernameTextFieldAction(_ sender: Any) {
        print("Login: \(usernameTextField.text ?? "") ")
    }
    @IBAction func passwordTextFieldAction(_ sender: Any) {
        print("Password: \(passwordTextField.text ?? "") ")
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        UserSettings.userName = username
        print(UserSettings.userName ?? "")
        UserSettings.password = password
        print(UserSettings.password ?? "")
        
        saveUserLoginAndPasswordInFile(login: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
        isValid(login: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        NetworkManager.shared.fechData()
    }
    
}

extension Authorization {
    //MARK: - функция записывает данные
    func saveUserLoginAndPasswordInFile(login: String, password: String) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let fileUrls = urls.first?.appendingPathComponent("users.txt") else {return}
        //        let username = usernameTextField.text
        //        let password = passwordTextField.text
        let username = login
        let password = password
        let userDictionary = [username : password]
        do {
            let userData = try JSONEncoder().encode(userDictionary)
            try userData.write(to: fileUrls)
            print("Successfully saved: \(fileUrls)")
        } catch  {
            print("Saving error: \(error)")
        }
    }
    
}


extension Authorization {
    
    func isValid(login: String, password: String) {
        //условия для перехода к другому экрану (при нажатии на кнопку)
        // Alert for login
        if login.count == 0 {
            // Initialize Alert Controller
            Alert().showAlert(title: "Incomplete Form", message: "Please fill out login fields.", viewController: self)
        }
        // Alert for password
        if password.count == 0 {
            // Initialize Alert Controller
            Alert().showAlert(title: "Incomplete Form", message: "Please fill out password fields.", viewController: self)
        }
        // Alert for password
        if password.count < 6 {
            // Initialize Alert Controller
            Alert().showAlert(title: "Alert", message: "Password must be at least 6 characters.", viewController: self)
        }
        
        if login.count > 0 || password.count > 6 {
            performSegue(withIdentifier: "PersonsCollectionVC", sender: nil)
        } else {}
    }
}
