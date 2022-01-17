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

    lazy var stackView = customStackButton().scroller  // добавление самого стека с кнопками и скроллом
    

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
        view.addSubview(stackView)
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
            collectionNews.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            collectionNews.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionNews.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -94),
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        

    }
    func createButtonsCategories(with title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = .clear
        newButton.setAttributedTitle(NSAttributedString(string: title,attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 16)]), for: .normal)
        newButton.setTitleColor(MyColors.myColor.color4easyLight, for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }
    
 
    //FIXME: reload button
    //MARK: -  actions
    func reloadButton() {
        let reloaded = headerView.reloadButton
        reloaded.addTarget(self, action: #selector(didTapReloadButton), for: .touchUpOutside)
    }
    
    func refreshControllCollectionView() {
        refreshControl.attributedTitle = NSAttributedString(string: "Потяните чтобы обновить",
                                                            attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 12),
                                                                         NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor])
        refreshControl.addTarget(self, action: #selector(refreshToControl), for: UIControl.Event.valueChanged)
        collectionNews.addSubview(refreshControl)
        
    }
    //MARK: reload collection view
    @objc override func didTapReloadButton() {
        CustomAI.showAI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.fetchTop()
            CustomAI.hide()
        }
    }
    @objc func refreshToControl() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fetchTop()
            self.refreshControl.endRefreshing()
        }
    }
 
    

    

}
extension MainHomeViewController {
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
                    DispatchQueue.main.async() {
                        self?.collectionNews.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
