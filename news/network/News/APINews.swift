//
//  APINews.swift
//  news
//
//  Created by Евгений Маглена on 03.01.2022.
//

import Foundation
import UIKit



class APINews {
    static let share = APINews()


    let firstUrl = "https://newsapi.org/v2/"
    var secondUrl = "everything?q=animal"
    var languageUrl = "&language=ru"
    let apiKey = "&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
//    "https://newsapi.org/v2/everything?q=animal&language=ru&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
   //  https://newsapi.org/v2/everything?q=interesting&language=ru&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5
    func getNews(_ categories:MainCategories,comletion:@escaping (Result<[Article], Error>) -> Void) {
        switch categories {
            case .alls:
                secondUrl = "everything?q=interesting"
            case .technology:
                secondUrl = "everything?q=technology"
            case .animals:
                secondUrl = "everything?q=animals"
            case .topHeadline:
                secondUrl = "top-headlines?country=ua&"
            case .music:
                secondUrl = "everything?q=music"
            case .business:
                secondUrl = "everything?q=business"
        }
        let urlString = "\(firstUrl)\(secondUrl)&language=ru\(apiKey)"

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
    

 
    }


    

    
    

