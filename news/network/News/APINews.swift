//
//  APINews.swift
//  news
//
//  Created by Евгений Маглена on 03.01.2022.
//

import Foundation
import UIKit

enum MainCategories {
    
    case technology
    case animals
    case music
    case business
    case topHeadline
    case alls
    
}
enum changeLanguage {
    case ru
    case us
}


class APINews {
    static let share = APINews()

    
    let urlMiddle = "https://newsapi.org/v2/everything?q=animal&language=ru&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
    let urlTwo = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
    
    let url3 = "https://newsapi.org/v2/top-headlines/sources?category=businessapiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
    
    
    let firstUrl = "https://newsapi.org/v2/"
    var secondUrl = "everything?q=animal"
    var languageUrl = "&language=ru"
    let apiKey = "&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
//    "https://newsapi.org/v2/everything?q=animal&language=ru&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"

    func getNews(cat: MainCategories,comletion:@escaping (Result<[Article], Error>) -> Void) {
        switch cat {
            case .alls:
                secondUrl = "everything?"
            case .technology:
                secondUrl = "everything?q=technology"
            case .animals:
                secondUrl = "everything?q=animal"
            case .music:
                secondUrl = "everything?q=music"
            case .business:
                secondUrl = "everything?q=business"
            case .topHeadline:
                secondUrl = "top-headlines?country=ua&"
           
                
        }
//        let urlString = "\(firstUrl)\(secondUrl)\(languageUrl)\(apiKey)"
        let urlString = "\(firstUrl)\(secondUrl)\(languageUrl)\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                comletion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print(result.articles.count)
                    comletion(.success(result.articles))
                }
                catch {
                    comletion(.failure(error))
                }
            }
        }.resume()
    }
    
    enum MainCategories {
        
        case technology
        case animals
        case music
        case business
        case topHeadline
        case alls
        
    }
    
//    func switcherNews(categories: MainCategories) {
//        switch categories {
//            case .technology:
//                secondUrl = "everything?q=technology"
//            case .animals:
//                secondUrl = "everything?q=animal"
//            case .music:
//                secondUrl = "everything?q=music"
//            case .business:
//                secondUrl = "everything?q=business"
//            case .topHeadline:
//                secondUrl = "top-headlines?country=ua&"
//            case .alls:
//                secondUrl = "everything?"
//
//        }
 
    }


    

    
    

