//
//  CollectionNewsCell.swift
//  news
//
//  Created by Евгений Маглена on 08.01.2022.
//

import UIKit

class CollectionNewsCell: UICollectionViewCell {
    
    static let identifier = "CollectionNewsCell"
    
    
    lazy var newsLabel: UILabel = { // lable
       var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = .gray
        lable.numberOfLines = 1
        return lable
        
    }()
    lazy var newsText: UILabel = {
        var  tex = UILabel()
        tex.translatesAutoresizingMaskIntoConstraints = false
        tex.backgroundColor = .yellow
        tex.numberOfLines = 0
        return  tex
        
    }()
    
    lazy var newsImage: UIImageView = {
        var  image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        return  image
        
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubviews()
        setConstraints()

    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: -  add subview
    func addSubviews() {
        contentView.addSubview(newsText)
        contentView.addSubview(newsLabel)
        contentView.addSubview(newsImage)

        
    }
    
    
    //MARK: - set constraints
    func setConstraints() {
        NSLayoutConstraint.activate([ // image
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)

            
        ])
            NSLayoutConstraint.activate([ // article news
            newsLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor),
            newsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([ // text news
            newsText.topAnchor.constraint(equalTo: newsLabel.bottomAnchor),
            newsText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    //MARK: - FETCH
    func configure(with viewModel: CollectionCellModel) {
        newsLabel.text = viewModel.title
        newsText.text = viewModel.subtitle
        
        //image
        if let data = viewModel.imageData {
            newsImage.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            //fetch
            URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
                guard let data = data, error == nil  else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImage.image = UIImage(data: data)
                }
            }.resume()
            
        }
    }
}
