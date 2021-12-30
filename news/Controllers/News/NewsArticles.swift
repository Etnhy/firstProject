//
//  NewsArticles.swift
//  news
//
//  Created by Евгений Маглена on 30.12.2021.
//

import UIKit
import NewsAPISwift

class NewsArticles: MainTableViewViewController {
    
    var newsAPI: NewsAPI!
    var source: NewsSource!
    
    
    var articles = [NewsArticle]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
         
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = source.name
        
        newsAPI.getTopHeadlines(sources: [source.id]){ result in
            switch result {
                case .success(let articles):
                    self.articles = articles
                case .failure(let error):
                    fatalError("\(error)")
            }
        }
        
        
    }
    
    func config() {
        
        tableView.estimatedRowHeight = 44.0
    }
    


}


