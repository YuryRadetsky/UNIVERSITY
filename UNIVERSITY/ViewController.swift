//
//  ViewController.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 08.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NeworkManager().fechData()
    }

}

extension ViewController {
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

