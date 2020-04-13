//
//  NetworkManager.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 10.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared =  NetworkManager()

    var array = [PersonElement]()
//   func fechData(completion: @escaping ([PersonElement]) -> Void){}
    func fechData() {
        let jsonUrlsString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: jsonUrlsString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {return}
            guard error == nil else {return}
            
            do {
                let json = try JSONDecoder().decode([PersonElement].self, from: data)
                print("JSON count: \(json.count)")
                print("JSON:\n \(json)")
                
                json.forEach { (person) in
                    self.array.append(PersonElement(id: person.id, name: person.name, username: person.username, email: person.email, address: person.address, phone: person.phone, website: person.website, company: person.company))
                }
                DispatchQueue.main.async {
//                    completion(self.array)
                    self.array
                }
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    
}
