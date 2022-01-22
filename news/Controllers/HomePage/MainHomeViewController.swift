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
    
    let refreshControl = UIRefreshControl()
    
    lazy var customScroll:CustomStackButton = {
        let view = CustomStackButton()
        view.myDelegate = self
     return view
    }()

    
    lazy var collectionNews: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let call = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        call.translatesAutoresizingMaskIntoConstraints = false
        call.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        call.isPagingEnabled = true
        
        return call
    }()

    


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = MyColors.myColor.color2leastDark.withAlphaComponent(0.7)
        addSub()
        setConstraints()
        settings()
        changeFetch()

    }
    
    
    //MARK: - add subviews
    private func addSub() {
        view.addSubview(collectionNews)
        view.addSubview(customScroll)
        refreshControllCollectionView()
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
            customScroll.topAnchor.constraint(equalTo: headerView.bottomAnchor.self),
            customScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customScroll.heightAnchor.constraint(equalToConstant: 48),
        ])
        NSLayoutConstraint.activate([
            collectionNews.topAnchor.constraint(equalTo: self.customScroll.bottomAnchor),
            collectionNews.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionNews.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -94),
        ])
    }
    //MARK: -  actions
    func reloadButton() {
        let reloaded = headerView.reloadButton
        reloaded.addTarget(self, action: #selector(didTapReloadButton), for: .touchUpOutside)
    }

    func changeCategory() {
        
    }
    
    
    func refreshControllCollectionView() {
        refreshControl.attributedTitle = NSAttributedString(string: "Потяните чтобы обновить.",
                                                            attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 12),
                                                                         NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor])
        refreshControl.addTarget(self, action: #selector(refreshToControl), for: UIControl.Event.valueChanged)
        collectionNews.addSubview(refreshControl)
        
    }
    //MARK: reload collection view
    @objc override func didTapReloadButton() {
        CustomAI.showAI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            CustomAI.hide()
            self.changeFetch()
        }

    }
    @objc func refreshToControl() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.changeFetch()
        }
        self.refreshControl.endRefreshing()
    }
}
extension MainHomeViewController {
    func changeFetch(_ categories: MainCategories = .alls) {   // [weak self]
        APINews.share.getNews( categories) { result  in
            switch result {
                case .success(let article):
                    self.articles = article
                    self.viewModels = article.compactMap({
                        CollectionCellModel(title: $0.title ?? "hz",
                                            subtitle: $0.description ?? "hz",
                                            imageURL: URL(string: $0.urlToImage ?? "hz image"),
                                            publishedAt: $0.publishedAt ?? "hz pub"
                        )
                    })
                    DispatchQueue.main.async {
                        self.collectionNews.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    @objc override func customStackButtonDelegate(_ selectedIndex: Int) {
       switch selectedIndex {
           case 0:
               changeFetch(.alls)
           case 1:
               changeFetch(.technology)
           case 2:
               changeFetch(.animals)
           case 3:
               changeFetch(.topHeadline)
           case 4:
               changeFetch(.music)
           case 5:
               changeFetch(.business)
           default:
               
               print("ads")
       }
    }
}
//case  alls
//case technology
//case animals
//case topHeadline
//case music
//case business
