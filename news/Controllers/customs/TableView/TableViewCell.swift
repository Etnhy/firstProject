//
//  TableViewCell.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    //let data = NewsArticles()

    
    let imageNews = UIImageView()
    let articlesNews = UILabel()
    let dateNews = UILabel()
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImage()
        setupArticlesNews()
        setupDateNews()
        setConstraints()
  
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TableViewCell")
        
        setupImage()
        setupArticlesNews()
        setupDateNews()
        setConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    //MARK: Settings
    func setupImage() {
        contentView.addSubview(imageNews)
        imageNews.translatesAutoresizingMaskIntoConstraints = false
        imageNews.backgroundColor = .black
        imageNews.contentMode = .scaleAspectFit
        imageNews.image = UIImage(named: "dog.jpg")
    }
    func setupArticlesNews() {
        contentView.addSubview(articlesNews)
        articlesNews.translatesAutoresizingMaskIntoConstraints = false
        articlesNews.backgroundColor = .white
        articlesNews.numberOfLines = 0
        articlesNews.textColor = .black
        articlesNews.text = "пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда"
    }
    func setupDateNews() {
        contentView.addSubview(dateNews)
        dateNews.translatesAutoresizingMaskIntoConstraints = false
        dateNews.backgroundColor = .gray
        dateNews.text = "Дата публикации: 21.12.21"
        dateNews.textAlignment = .center
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([ // image news
            imageNews.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageNews.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageNews.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageNews.heightAnchor.constraint(equalToConstant: 140)
        ])
        NSLayoutConstraint.activate([
            articlesNews.topAnchor.constraint(equalTo: self.imageNews.bottomAnchor, constant: 2),
            articlesNews.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            articlesNews.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            articlesNews.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -20)
        ])
        NSLayoutConstraint.activate([
            dateNews.topAnchor.constraint(equalTo: articlesNews.bottomAnchor),
            dateNews.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 8),
            dateNews.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -140),
            dateNews.heightAnchor.constraint(equalToConstant: 20),
            dateNews.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4)
        ])
//
    }
    


}


