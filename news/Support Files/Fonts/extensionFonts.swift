//
//  extensionFonts.swift
//  news
//
//  Created by Евгений Маглена on 14.01.2022.
//

import UIKit


extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func GTWalsheimProRegular(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "GTWalsheimProRegular", size: size)
    }
    static func GTWalsheimProBold(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "GTWalsheimProBold", size: size)
    }
    static func GTWalsheimProLight(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "GTWalsheimProLight", size: size)
    }
    static func GTWalsheimProMedium(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "GTWalsheimProMedium", size: size)
    }
    static func GTWalsheimProThin(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "GTWalsheimProThin", size: size)
    }
}
