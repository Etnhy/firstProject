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
    
    lazy var topScrollView:UIScrollView = {
       var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .green
        
        return scroll
    }()


    // did load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight

        addSubviews()
        
        view.addSubview(topScrollView)
        settingsTableView()
        

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
 
    }
    //layout subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        tableView.frame = CGRect(x: 0,
                                 y: 40,
                                 width: view.frame.size.width,
                                 height: view.frame.size.height)
        
        topScrollView.frame = CGRect(x: 0,
                                     y: 40,
                                     width: view.frame.size.width,
                                     height: 80)
 
    }
    
    //MARK: settings
    
    func addSubviews() { // add subviews
        self.view.addSubview(tableView)
    }
    func settingsTableView () { // settings table view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
}
