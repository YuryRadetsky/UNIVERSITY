//
//  ViewController.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 08.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit

final class Authorization: UIViewController {
    
    private var seguewIdentifier = "PersonsCollectionVC"
    
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        NetworkManager.shared.fechData()
    }
    
    @IBAction private func usernameTextFieldAction(_ sender: Any) {
        print("Login: \(usernameTextField.text ?? "") ")
    }
    
    @IBAction private func passwordTextFieldAction(_ sender: Any) {
        print("Password: \(passwordTextField.text ?? "") ")
    }
    
    @IBAction private func saveButton(_ sender: Any) {
        UserSettings.userName = usernameTextField.text
        UserSettings.password = passwordTextField.text
        
        saveUserLoginAndPasswordInFile(login: usernameTextField.text ?? "",
                                       password: passwordTextField.text ?? "")
        isValid(login: usernameTextField.text ?? "",
                password: passwordTextField.text ?? "")
    }
    
    @IBAction private func segmentTapped(_ sender: Any) {
        let getIndex = segmentedControl.selectedSegmentIndex
        switch getIndex {
        case 0:
            parent?.overrideUserInterfaceStyle = .light
        case 1:
            parent?.overrideUserInterfaceStyle = .dark
        case 2:
            parent?.overrideUserInterfaceStyle = .unspecified
        default:
            print("no select")
        }
    }
    
}

extension Authorization {
    
    // Safe data
    private func saveUserLoginAndPasswordInFile(login: String, password: String) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let fileUrls = urls.first?.appendingPathComponent("users.txt") else {return}
        let userDictionary = [login : password]
        do {
            let userData = try JSONEncoder().encode(userDictionary)
            try userData.write(to: fileUrls)
            print("Successfully saved: \(fileUrls)")
        } catch  {
            print("Saving error: \(error)")
        }
    }
    
    private func isValid(login: String, password: String) {
        if login.isEmpty || password.isEmpty {
            Alert().showAlert(title: "Incomplete Form",
                              message: "Login or Password is empty!",
                              viewController: self)
        } else if !login.isEmpty && password.count < 6 {
            Alert().showAlert(title: "Alert",
                              message: "Password must be at least 6 characters.",
                              viewController: self)
        } else {
            performSegue(withIdentifier: seguewIdentifier, sender: nil)
        }
    }
}
