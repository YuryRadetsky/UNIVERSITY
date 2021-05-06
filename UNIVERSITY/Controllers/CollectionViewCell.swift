//
//  CollectionViewCell.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 11.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var id: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var username: UILabel!
    @IBOutlet var company: UILabel!
    
    var namePerson: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var companyPerson: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(namePerson)
        namePerson.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        namePerson.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        addSubview(companyPerson)
        companyPerson.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 10).isActive = true
        companyPerson.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
