//
//  HomePageViewController.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class HomePageVC: MainTableViewViewController {
    let colors = MyColors()
    
    var data:[String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        
        downloadData()
        
    }
    func configure() {
        tableView.backgroundColor = colors.color1Dark
    }
}
//MARK: - FETCH
extension HomePageVC {
    func downloadData() {
        data = []
        APINews.share.getNews { [weak self] result in
            switch result {
                case .success(let article):
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
