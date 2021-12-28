//
//  TableViewCell.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var image:UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    
    func setImageConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
        
        ])
        
    }

}
