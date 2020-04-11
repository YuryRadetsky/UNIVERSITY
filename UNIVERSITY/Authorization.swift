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
        
        saveUserLoginAndPasswordInFile()
        isValid()
//        isValid2()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager().fechData()
    }

}

extension Authorization {
        //MARK: - функция записывает данные 
    func saveUserLoginAndPasswordInFile() {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let fileUrls = urls.first?.appendingPathComponent("users.txt") else {return}
        let username = usernameTextField.text
        let password = passwordTextField.text
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
    
    func isValid() {
        //условия для перехода к другому экрану (при нажатии на кнопку)
        guard let login = usernameTextField.text,
            let password = passwordTextField.text else { return }
        // Alert for login
        if login.count == 0 {
            // Initialize Alert Controller
            showAlert(title: "Incomplete Form", message: "Please fill out login fields.")
        }
        // Alert for password
        if password.count == 0 {
            // Initialize Alert Controller
            showAlert(title: "Incomplete Form", message: "Please fill out password fields.")
        }
        // Alert for password
        if password.count < 6 {
            // Initialize Alert Controller
            showAlert(title: "Alert", message: "Password must be at least 6 characters.")
        }
        performSegue(withIdentifier: "CollectionVC", sender: nil)
    }
    
    func showAlert(title: String, message: String) {
        // Initialize Alert Controller
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Initialize Actions
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        // Initialize Actions
        alert.addAction(alertAction)
        // Present Alert Controller
        self.present(alert, animated: true, completion: nil)
    }
}

//extension Authorization {
//    func isValid2() {
//        let login = usernameTextField.text
//        let password = passwordTextField.text
//
//        if (login?.count == 0) || (password?.count == 0) {
//            Alert().showAlert(title: "Incomplete Form", message: "Please fill out both login and password fields", viewController: self)
//        }
//    }
//}
