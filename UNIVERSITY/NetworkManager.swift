//
//  NetworkManager.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 14.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let jsonUrlsString = "https://jsonplaceholder.typicode.com/users"
    var personsArray = [PersonElement]()
    
    func fechData(url: String, completion: @escaping() -> Void) -> [PersonElement] {
        guard let url = URL(string: url) else {return []}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {return}
            guard error == nil else {return}
            
            do {
                self.personsArray = try JSONDecoder().decode([PersonElement].self, from: data)
                print("JSON count: \(self.personsArray.count)")
                print("JSON:\n \(self.personsArray)")
                
                
                DispatchQueue.main.async {
                    completion()
                }
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
        return personsArray
    }
}
