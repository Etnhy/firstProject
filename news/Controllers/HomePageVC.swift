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
    
    //MARK: settings
    private func settingsView() { // settings vc
        self.view.backgroundColor = .red
    }
    
    private func addSubviews() { // add subviews
        self.view.addSubview(tableView)
    }
    
    private func settingsTableView () { // settings table view
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
    }
    


}
