//
//  newsModel.swift
//  news
//
//  Created by Евгений Маглена on 01.01.2022.
//

import Foundation



struct Article: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
}

struct APIResponse: Codable {
    let articles: [Article]
}


enum CodingKeys: String, CodingKey {
    case author, title, description, url, urlToImage, publishedAt, content
}
