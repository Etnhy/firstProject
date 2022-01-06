//
//  MainTableViewViewController.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit
import NewsAPISwift

class MainTableViewViewController: UIViewController {
    
    let tableView = UITableView()
    
     var viewModels = [TableViewCellmodel]()
    var articles = [Article]()

    // did load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight

        addSubviews()
        settingsTableView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
 
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
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
}
