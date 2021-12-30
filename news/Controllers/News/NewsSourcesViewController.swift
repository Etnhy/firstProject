//
//  NewsSourcesViewController.swift
//  news
//
//  Created by Евгений Маглена on 30.12.2021.
//

import Foundation
import UIKit
import NewsAPISwift

class NewsManager: MainTableViewViewController {
    
    
    let newsAPI = NewsAPI(apiKey: "3b7a57f2d0e3400e9193cd86f1ba0fb5")
    var sources = [NewsSource]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSources()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        

    }
    func getSources() {
        newsAPI.getSources(category: .technology, language: .en, country: .all) { result in
            switch result {
                case .success(let sourceList):
                    print(sourceList)
                case .failure(let error):
                    fatalError("\(error)")
            }
        }
    }
    
    
    
    func getNews() {
        
        
    }
    
    
    
}

