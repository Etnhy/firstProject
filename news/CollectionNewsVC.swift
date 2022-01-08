//
//  CollectionNewsVC.swift
//  news
//
//  Created by Евгений Маглена on 08.01.2022.
//

import UIKit

class CollectionNewsVC: UIViewController {
   static let identifier = "CollectionNewsVC"

    
    var viewModels = [CollectionCellModel]()
    var articles = [Article]()
    
    
     let collectionNews: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let call = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        call.translatesAutoresizingMaskIntoConstraints = false
        call.register(CollectionNewsCell.self, forCellWithReuseIdentifier: CollectionNewsCell.identifier)
        return call
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        addSub()
        settings()
        setConstraints()

        

        

    }
    //MARK: - add subviews
    private func addSub() {
        view.addSubview(collectionNews)
    }
    
    //MARK: - setting
    
    private func settings() {
        collectionNews.dataSource = self
        collectionNews.delegate = self
    }
    
    //MARK: - set constraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionNews.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionNews.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionNews.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    


}
