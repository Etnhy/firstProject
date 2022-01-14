//
//  FavoriteTableViewCell.swift
//  news
//
//  Created by Евгений Маглена on 10.01.2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    let colors = MyColors()
    
    static let identifier = "FavoriteTableViewCell"
    
    lazy var favImage:UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.backgroundColor = .black
        return image
    }()
    
    lazy var favTextNews:UILabel = {
        var v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.textAlignment = .left
        v.contentMode = .top
        v.font = .GTWalsheimProMedium(ofSize: 16)
//        v.font = .systemFont(ofSize: 16, weight: .medium)
        v.textColor = MyColors.myColor.coldColor
        v.text = " тут будет какой то текст - это для теста"
        return v
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: FavoriteTableViewCell.identifier)
        
        contentView.addSubview(favImage)
        contentView.addSubview(favTextNews)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCons()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - constraints
    func setCons() {
        
        NSLayoutConstraint.activate([
            favImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 2),
            favImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            favImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            favImage.widthAnchor.constraint(equalToConstant: contentView.frame.height )
        ])
        
        NSLayoutConstraint.activate([
            favTextNews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            favTextNews.leadingAnchor.constraint(equalTo: favImage.trailingAnchor, constant: 2),
            favTextNews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            favTextNews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -2),
        ])

    }
    
    
    

}
