//
//  ViewController.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 08.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    
    @IBAction func usernameTextField(_ sender: Any) {
        print(username.text)
    }
    @IBAction func passwordTextField(_ sender: Any) {
        print(password.text)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        // функция trimmingCharacters удаляет пустые пространства
        let usernameTrimmingText = username.text?.trimmingCharacters(in: .whitespaces)
        
        UserSettings.userName = usernameTrimmingText
        print(UserSettings.userName)
        
        let passwordText = password.text
        UserSettings.password = passwordText
        print(UserSettings.password)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

