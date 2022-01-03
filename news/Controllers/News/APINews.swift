//
//  APINews.swift
//  news
//
//  Created by Евгений Маглена on 03.01.2022.
//

import Foundation


class APINews {
    
    let urlBase = "https://newsapi.org/v2"
    let urlMiddle = "/top-headlines?country=us"
    let urlTwo = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
    //"https://newsapi.org/v2/everything?q=tesla&from=2021-12-03&sortBy=publishedAt&apiKey=3b7a57f2d0e3400e9193cd86f1ba0fb5"
    
    static let share = APINews()
    
    
    func getNews(comletion:@escaping (Result<[Article], Error>) -> Void) {
        let urlString = urlTwo
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
