//
//  getNewsViewController.swift
//  news
//
//  Created by Евгений Маглена on 01.01.2022.
//

import UIKit
import NewsAPISwift

class getNewsViewController: UIViewController {
    
    
    let newsAPI = NewsAPI(apiKey: "3b7a57f2d0e3400e9193cd86f1ba0fb5")
    
//    var sources = [NewsSource]() {
//        didSet {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    func getData() {
//
//        newsAPI.getTopHeadlines(category: .all, language: .en, country: .ae) { result in
//            switch Result {
//                case .success(let headline):
//                    print(success)
//                case .failure(let error):
//                    print(NewsAPIError)
//
//            }
//        }
//    }
//

}
