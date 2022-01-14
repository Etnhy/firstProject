//
//  HomeModel.swift
//  news
//
//  Created by Евгений Маглена on 14.01.2022.
//

import Foundation

class CollectionCellModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    var publishedAt: String
    
    
    init(title:String, subtitle: String, imageURL: URL?,publishedAt: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.publishedAt = publishedAt
    }
}
