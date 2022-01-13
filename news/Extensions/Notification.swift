//
//  Notification.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import Foundation


extension Notification.Name {
    static let TokenDidChange
        = NSNotification.Name("TokenDidChange")
    static let ProfileDidChange
        = NSNotification.Name("ProfileDidChange")
    static let AddedBooking
        = NSNotification.Name("AddedBooking")
    static let CurrentDidChange
        = NSNotification.Name("CurrentDidChange")
}
