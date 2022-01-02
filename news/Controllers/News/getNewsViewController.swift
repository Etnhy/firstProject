//
//  getNewsViewController.swift
//  news
//
//  Created by Евгений Маглена on 01.01.2022.
//

import UIKit
import NewsAPISwift

class getNewsViewController: UIViewController {
    
    
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = getNewsViewController()
    
    let urlBase = "https://newsapi.org/v2"
    let urlMiddle = "/top-headlines?country=us"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func getNews(completion: @escaping([News]?) -> Void) {
        let urlString = "\(urlBase)\(urlMiddle)&apiKey=\(APIkey.key)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let newsEnvelope = try? JSONDecoder().decode(ResultNews.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.article)
        }.resume()
        
        
    }
    
    func getImageNews(urlString: String, completion: @escaping(Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string:urlString)) {
            completion(cachedImage as Data)
        } else {
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
