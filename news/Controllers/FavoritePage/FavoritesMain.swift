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
    
    lazy var titleFavorite: UILabel = {
       var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Избранное:"
        title.textColor = colors.color4easyLight
        title.font = .systemFont(ofSize: 34, weight: .bold)
        return title
        
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
        view.addSubview(titleFavorite)
    }

    
    //MARK: - set constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            favoriteTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            favoriteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            //titleFavorite.bottomAnchor.constraint(equalTo: favoriteTableView.topAnchor, constant: 24),
            titleFavorite.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            titleFavorite.widthAnchor.constraint(equalToConstant: view.frame.width),
            titleFavorite.topAnchor.constraint(equalTo: view.topAnchor, constant: 76)
        ])
        
    }
    
    //MARK: - <#name#>
    



}