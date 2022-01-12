//
//  FavoritesModel.swift
//  news
//
//  Created by Евгений Маглена on 10.01.2022.
//

import Foundation


struct FavoritesModel: Codable {
    
    let url: String
    let name: String
    //let image: String?
    
    init(url: String?, name: String) {
        self.url = url
        self.name = name
    }
    
}
