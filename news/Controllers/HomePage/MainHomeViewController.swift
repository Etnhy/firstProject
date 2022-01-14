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
    
    lazy var stackCategories: ScrollViewCategories = {
       var stack = ScrollViewCategories()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MyColors.myColor.color2leastDark.withAlphaComponent(0.7)
        addSub()
        setConstraints()
        settings()
        fetchTop()
    }
    //MARK: - add subviews
    private func addSub() {
        view.addSubview(collectionNews)
//        view.addSubview(stackCategories)

    }
    
    //MARK: - setting
    
    private func settings() {
        collectionNews.backgroundColor = MyColors.myColor.color2leastDark.withAlphaComponent(0.7)
        collectionNews.dataSource = self
        collectionNews.delegate = self
    }
    
    //MARK: - set constraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionNews.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionNews.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionNews.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -94),
        ])
//        stackCategories.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
//        stackCategories.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        stackCategories.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        stackCategories.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    //FIXME: reload button
    //MARK: -  actions
    func reloadButton() {
        let reloaded = headerView.reloadButton
        reloaded.addTarget(self, action: #selector(reloadCollectionView), for: .touchUpOutside)
    }
    @objc func reloadCollectionView() {
        fetchTop()
        
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
