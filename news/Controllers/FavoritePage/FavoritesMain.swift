//
//  FavoritesMain.swift
//  news
//
//  Created by Евгений Маглена on 10.01.2022.
//

import UIKit

class FavoritesMain: MainViewController {
    
    
    var favo = [FavoritesModel]() {
        didSet {
            DispatchQueue.main.async {
                self.favoriteTableView.reloadData()
                print("data reloaded")
            }
        }
    }
    

    
    lazy var favoriteTableView: UITableView = {
       var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(FavoriteTableViewCell.self , forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        table.backgroundColor = MyColors.myColor.color2leastDark
        table.layer.cornerRadius = 12
        table.clipsToBounds = true
        return table
        
    }()
    
    lazy var titleFavorite: UILabel = {
       var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .GTWalsheimProBold(ofSize: 34)
        title.text = "Избранное:"
        title.textColor = MyColors.myColor.color4easyLight
//        title.font = .systemFont(ofSize: 34, weight: .bold)
        return title
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSub()
        headerView.reloadButton.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
        

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
            favoriteTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 80),
            favoriteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            //titleFavorite.bottomAnchor.constraint(equalTo: favoriteTableView.topAnchor, constant: 24),
            titleFavorite.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            titleFavorite.widthAnchor.constraint(equalToConstant: view.frame.width),
            titleFavorite.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24)
        ])
        
    }
    
    



}

