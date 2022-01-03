//
//  TableViewCellModel.swift
//  news
//
//  Created by Евгений Маглена on 03.01.2022.
//

import Foundation


class TableViewCellmodel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    
    init(title:String, subtitle: String, imageURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
    
}
