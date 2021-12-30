//
//  TableViewCell.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    lazy var image:UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.backgroundColor = .black
        return image
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        selectionStyle = .none
        
        
        contentView.addSubview(image)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(image)
        setImageConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setImageConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
        
        ])
        
    }

}
