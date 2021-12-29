//
//  NetworkManage.swift
//  news
//
//  Created by Евгений Маглена on 29.12.2021.
//

import Foundation


class GetNews {
    let imageCache = NSCache<NSString, NSData>()
    
    
    static let shared = GetNews()
    private init() {}
    
    private let urlString = "https://newsapi.org/v2"
    private let topHeadline = "/top-headlines?country=ua"
    
    
    func getNews(completion: @escaping([News]?) -> Void )  {
        let urlString = "\(urlString)\(topHeadline)&apiKey=\(APIkey.key)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let newsEnv = try? JSONDecoder().decode(NewsEnv.self, from: data)
            newsEnv == nil ? completion(nil) : completion(newsEnv!.articles)
        }.resume()
        
    }
    
    func getimage(urlString: String, completion: @escaping(Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        }else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)

            }.resume()
        }
        
    }
}
