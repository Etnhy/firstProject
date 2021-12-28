//
//  RegistrationViewModel.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import Foundation


struct RegistrationModel: Codable {
    var data: [String:String] = ["email" : "", "password" : "","name": "",
                                 "surname" : "","birthday" :""]
    
    var name:String = ""
    var surname:String = ""
    var birthday:String = ""
    
    var email:String = ""
    var password:String = ""
}


