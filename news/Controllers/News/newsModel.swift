//
//  newsModel.swift
//  news
//
//  Created by Евгений Маглена on 01.01.2022.
//

import Foundation



struct News: Codable {
    
    var author: String = " "
    var title: String = " "
    var description: String = " "
    var url: String = " "
    var urlToImage: String = " "
    var publishedAt: String = " "
    var content: String = " "
    
}

struct result: Codable {
    var article:[News] = []
}
