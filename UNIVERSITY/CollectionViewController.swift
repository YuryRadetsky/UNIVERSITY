//
//  CollectionViewController.swift
//  UNIVERSITY
//
//  Created by Yury Radetsky on 11.04.2020.
//  Copyright © 2020 YuryRadetsky. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    let cellID = "Cell"
    var network = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        // Do any additional setup after loading the view.
//        fechData(url: jsonUrlsString, completion: {self.collectionView.reloadData()})
        NetworkManager.shared.fechData(url: NetworkManager.shared.jsonUrlsString, completion: {
            print("_____________________ CollectionViewController count \(self.network.personsArray.count)")
            self.collectionView.reloadData()})
                
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    //количество элементов, которые находятся в одной секции
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return NetworkManager.shared.personsArray.count
    }
    
    //создаем ячейку, где указываем все ее характеристики и при  загрузки значение ячейки берется из этого метода
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // создали отдельный класс для нашей ячейки в файле CollectionViewCell и обратились к нему при помощи "as! CollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        
        // Configure the cell
//        cell.name.text = network.personsArray[indexPath.row].name
//        cell.username.text = network.personsArray[indexPath.row].username
//        cell.company.text = network.personsArray[indexPath.row].company.name
        
        cell.backgroundColor = .systemYellow
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
