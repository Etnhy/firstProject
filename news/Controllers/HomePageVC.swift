//
//  HomePageViewController.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class HomePageVC: UIViewController {
    
    private let tableView = UITableView()

    
    
    // did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView()
        addSubviews()
        
    }
    //layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        settingsTableView()
        
    }
    
    
    private func settingsView() {
        self.view.backgroundColor = .red
    }
    
    private func addSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func settingsTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
    }
    


}
