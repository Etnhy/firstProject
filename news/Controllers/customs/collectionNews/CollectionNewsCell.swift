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
        lable.font = .systemFont(ofSize: 16, weight: .bold)
        lable.numberOfLines = 2
        return lable
        
    }()
    lazy var newsText: UILabel = {
        var  tex = UILabel()
        tex.translatesAutoresizingMaskIntoConstraints = false
        tex.font = .systemFont(ofSize: 14, weight: .medium)
        tex.numberOfLines = 0
        tex.contentMode = .scaleAspectFill
        tex.lineBreakMode = .byWordWrapping
        tex.sizeToFit()
 
        return  tex
        
    }()
    
    lazy var newsImage: UIImageView = {
        var  image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        image.clipsToBounds = true
        return  image
        
    }()
    lazy var addToFavoritsButton: UIButton = {
       let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .black
        b.layer.cornerRadius = 17
        b.setImage(UIImage(named: "favorites@25px"), for: .normal)
        b.addTarget(self, action: #selector(addToFavo), for: .touchUpInside)
        return b
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
    override func prepareForReuse() {
        super.prepareForReuse()
        newsText.text = nil
        newsLabel.text = nil
        newsImage.image = nil
    }
    
    //MARK: -  add subview
    func addSubviews() {
        contentView.addSubview(newsText)
        contentView.addSubview(newsLabel)
        contentView.addSubview(newsImage)
        contentView.addSubview(addToFavoritsButton)

        
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
            newsLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor,constant: 0),
            newsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsLabel.heightAnchor.constraint(equalToConstant: 24),
            
        ])
        NSLayoutConstraint.activate([ // text news
            newsText.topAnchor.constraint(equalTo: newsLabel.bottomAnchor),
            newsText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            addToFavoritsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addToFavoritsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            addToFavoritsButton.widthAnchor.constraint(equalToConstant: 34),
            addToFavoritsButton.heightAnchor.constraint(equalToConstant: 34),
        ])
    }
    
    //MARK: - actions
    
    @objc func addToFavo() {
        print("yes")
        
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
