//
//  MainTableViewViewController.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class MainTableViewViewController: UIViewController {
    
    let tableView = UITableView()
    
 
    
    // did load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight

        addSubviews()
        settingsTableView()
        

    }
    //layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    //MARK: settings
    
    func addSubviews() { // add subviews
        self.view.addSubview(tableView)
    }
    
    func settingsTableView () { // settings table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    

}
