//
//  NewsModel.swift
//  news
//
//  Created by Евгений Маглена on 29.12.2021.
//

import Foundation



struct News: Decodable {
    
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}


struct NewsEnv: Decodable {
    let status: String
    let totalResult: Int
    let articles: [News]
}
