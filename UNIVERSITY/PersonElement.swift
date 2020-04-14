//
//  PersonElement.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 15.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import Foundation
// MARK: - PersonElement
struct PersonElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
