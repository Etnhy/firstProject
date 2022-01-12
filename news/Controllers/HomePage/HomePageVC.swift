//
//  HomePageViewController.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class HomePageVC: CollectionNewsVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MyColors.myColor.color1Dark
        navigationController?.isNavigationBarHidden = true

        
        fetchTop()
        
  
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


