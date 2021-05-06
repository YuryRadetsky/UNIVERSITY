//
//  CollectionViewController.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 11.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
    
    private let cellID = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        NetworkManager.shared.fechData(url: NetworkManager.shared.jsonUrlsString) {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NetworkManager.shared.personsArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        cell.namePerson.text = NetworkManager.shared.personsArray[indexPath.row].name
        cell.companyPerson.text = NetworkManager.shared.personsArray[indexPath.row].company.name
        cell.backgroundColor = .systemYellow
        return cell
    }
    
}
