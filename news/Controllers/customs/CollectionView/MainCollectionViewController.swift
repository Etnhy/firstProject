//
//  MainCollectionViewController.swift
//  news
//
//  Created by Евгений Маглена on 29.12.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(mainCollectionViewCell.self, forCellWithReuseIdentifier: "mainCollectionViewCell")
        
        settings()
    }

    func settings() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }

}
