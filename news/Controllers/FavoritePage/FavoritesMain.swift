//
//  FavoritesMain.swift
//  news
//
//  Created by Евгений Маглена on 10.01.2022.
//

import UIKit

class FavoritesMain: UIViewController {
    let colors = MyColors()
    
    lazy var favoriteTableView: UITableView = {
       var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(FavoriteTableViewCell.self , forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        table.backgroundColor = colors.color1Dark
        table.layer.cornerRadius = 12
        table.clipsToBounds = true
        return table
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSub()
        

    }
    //MARK: - LayoutSub
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
        
    }
    
    //MARK: - add sub
    private func addSub() {
        view.addSubview(favoriteTableView)
    }

    
    //MARK: - set constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            favoriteTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    //MARK: - <#name#>
    



}
