//
//  NetworkManager.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 10.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import Foundation

class NeworkManager {
    
    func fechData() {
        let jsonUrlsString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: jsonUrlsString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {return}
            guard error == nil else {return}
            
            do {
                let json = try JSONDecoder().decode(Person.self, from: data)
                print("JSON count: \(json.count)")
                print("JSON:\n \(json)")
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
        
    }
}
