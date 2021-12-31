//
//  NewsArticles.swift
//  news
//
//  Created by Евгений Маглена on 30.12.2021.
//

import UIKit
import NewsAPISwift

class NewsArticles: MainTableViewViewController {
    static let newsSet = NewsArticles()
    
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

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = source.name
        

        
        
    }
    func getArticles() {
        newsAPI.getTopHeadlines(sources: [source.id]){ result in
            switch result {
                case .success(let articles):
                    self.articles = articles
                case .failure(let error):
                    fatalError("\(error)")
            }
        }
    }
    

    


}


