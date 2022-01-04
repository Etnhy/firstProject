//
//  HomePageViewController.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class HomePageVC: MainTableViewViewController {
    let colors = MyColors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        
        fetchTop()
        
    }
    func configure() {
        tableView.backgroundColor = colors.color1Dark
    }
    //MARK: - FETCH
    func fetchTop() {
        APINews.share.getNews { [weak self] result in
            switch result {
                case .success(let article):
                    self?.articles = article
                    self?.viewModels = article.compactMap({
                        TableViewCellmodel(
                            title: $0.title ?? " no title",
                            subtitle: $0.description ?? " no descrtiption",
                            imageURL: URL(string: $0.urlToImage ?? "no urlToImage")
                        )
                    })
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}


