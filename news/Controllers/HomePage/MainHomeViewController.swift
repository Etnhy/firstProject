//
//  MainHomeViewController.swift
//  news
//
//  Created by Евгений Маглена on 14.01.2022.
//

import UIKit

class MainHomeViewController: MainViewController {
    static let identifier = "CollectionNewsVC"
    
    
    var viewModels = [CollectionCellModel]()
    var articles = [Article]()
    
    
    let collectionNews: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        //layout.minimumInteritemSpacing = 220
        //layout.sectionInset.top = 40
        //layout.sectionInset.bottom = 320
        let call = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        call.translatesAutoresizingMaskIntoConstraints = false
        call.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        call.isPagingEnabled = true
        
        return call
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.isHidden = true
        collectionNews.backgroundColor = MyColors.myColor.color1Dark
        addSub()
        settings()
        setConstraints()
        fetchTop()
        
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
            collectionNews.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionNews.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionNews.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func fetchTop() {
        APINews.share.getNews { [weak self] result in
            switch result {
                case .success(let article):
                    self?.articles = article
                    self?.viewModels = article.compactMap({
                        CollectionCellModel(
                            title: $0.title ?? " no title",
                            subtitle: $0.description ?? " no descrtiption",
                            imageURL: URL(string: $0.urlToImage ?? "no urlToImage"),
                            publishedAt: $0.publishedAt ?? "no date"
                            
                        )
                    })
                    DispatchQueue.main.async {
                        self?.collectionNews.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
