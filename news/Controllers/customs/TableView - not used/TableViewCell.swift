//
//  TableViewCell.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    lazy var titleLabel: UILabel = { // title
        var label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = MyColors.myColor.coldColor
        label.numberOfLines = 0
        return label
    }()
    lazy var subTitleLabel: UILabel = { // subtitle
        
        var subTitle = UILabel()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.numberOfLines = 0
        subTitle.font = .systemFont(ofSize: 15, weight: .light)
        subTitle.textColor = MyColors.myColor.coldColor
        return subTitle
        
    }()
    lazy var newsImageView: UIImageView = { // image view
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
        contentView.backgroundColor = MyColors.myColor.color3light.withAlphaComponent(0.7)

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setLayoutSubviews()
        
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subTitleLabel.text = nil
        newsImageView.image = nil
    }
    

        
    
    //MARK: Settings
    func setLayoutSubviews() {
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
    //MARK: confing and fetch? image
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

    


}

