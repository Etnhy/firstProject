//
//  HomePageViewController.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class HomePageVC: MainTableViewViewController {
    let colors = MyColors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.configure()
        
        

    }


    func configure() {
        tableView.backgroundColor = colors.color1Dark
        
    }
    


}
