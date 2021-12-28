//
//  ProfileVC.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    lazy var buttonRegistration:UIButton = {
       var but = UIButton()
        return but
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        settingsVC()

        


    }
    
    private func settingsVC() {
        
        self.view.backgroundColor = .cyan
    }
    


}
