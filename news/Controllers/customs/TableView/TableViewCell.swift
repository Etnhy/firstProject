//
//  TableViewCell.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    
    lazy var subTitleLabel: UILabel = {
        
        var subTitle = UILabel()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.numberOfLines = 0
        subTitle.font = .systemFont(ofSize: 15, weight: .light)
        //subTitle.textColor = .black
        return subTitle
        
    }()
    
    lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }()
 
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TableViewCell")
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(newsImageView)

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 10,
                                  y: 0,
                                  width: contentView.frame.size.width - 170,
                                  height: contentView.frame.size.height/2)
        subTitleLabel.frame = CGRect(x: 10,
                                     y: 70,
                                  width: contentView.frame.size.width - 170,
                                  height: 70)
        newsImageView.frame = CGRect(x: contentView.frame.size.width - 150,
                                     y: 20,
                                  width: 150,
                                  height: contentView.frame.size.height - 20)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subTitleLabel.text = nil
        newsImageView.image = nil
    }
    
    func configure(with viewModel: TableViewCellmodel) {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subtitle
        
        //image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            //fetch
            URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
                guard let data = data, error == nil  else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
            
        }
    }
        
    
    //MARK: Settings
//    func setupImage() {
//        contentView.addSubview(imageNews)
//        imageNews.translatesAutoresizingMaskIntoConstraints = false
//        imageNews.backgroundColor = .black
//        imageNews.contentMode = .scaleAspectFit
//        imageNews.image = UIImage(named: "dog.jpg")
//    }
//    func setupArticlesNews() {
//        contentView.addSubview(articlesNews)
//        articlesNews.translatesAutoresizingMaskIntoConstraints = false
//        articlesNews.backgroundColor = .white
//        articlesNews.numberOfLines = 0
//        articlesNews.textColor = .black
//        articlesNews.text = "пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда пропал дог позвоните сюда"
//    }
//    func setupDateNews() {
//        contentView.addSubview(dateNews)
//        dateNews.translatesAutoresizingMaskIntoConstraints = false
//        dateNews.backgroundColor = .gray
//        dateNews.text = "Дата публикации: 21.12.21"
//        dateNews.textAlignment = .center
//
//    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([ // image news
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
//        NSLayoutConstraint.activate([
//            articlesNews.topAnchor.constraint(equalTo: self.imageNews.bottomAnchor, constant: -20),
//            articlesNews.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            articlesNews.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            articlesNews.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -20)
//        ])
//        NSLayoutConstraint.activate([
//            dateNews.topAnchor.constraint(equalTo: articlesNews.bottomAnchor,constant: -10),
//            dateNews.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 8),
//
//        ])
    }
    


}

