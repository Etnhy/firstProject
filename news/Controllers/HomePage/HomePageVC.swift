//
//  HomePageViewController.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class HomePageVC: CollectionNewsVC {
    private var headerViewHeight: NSLayoutConstraint!
    
    lazy var headerView: MainHeaderView = {
        let view = MainHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        headerView.isHidden = true

        self.view.backgroundColor = MyColors.myColor.color1Dark
        
        setupViews()
        addSubviews()
        activateConstraints()
        
        fetchTop()
        
  
    }
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        headerViewHeight.constant = 60 + view.safeAreaInsets.top
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
    }
    
    
    private func addSubviews() {
        view.addSubview(headerView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        headerViewHeight = headerView.heightAnchor.constraint(equalToConstant: 60 + view.safeAreaInsets.top)
        headerViewHeight.isActive = true
    }
    //MARK: Actions
    @objc func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    

    //MARK: - FETCH
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


//MARK: - UIGestureRecognizerDelegate
extension HomePageVC: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if(navigationController!.viewControllers.count > 1){
            return true
        }
        return false
    }
}
