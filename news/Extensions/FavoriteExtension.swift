//
//  FavoriteExtension.swift
//  news
//
//  Created by Евгений Маглена on 10.01.2022.
//

import Foundation
import UIKit


extension FavoritesMain: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard  let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as? FavoriteTableViewCell else {
            fatalError()
        }
        cell.backgroundColor = MyColors.myColor.color1Dark.withAlphaComponent(0.5)

        cell.favTextNews.text = favo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hed = UIView()
        hed.backgroundColor = .clear
        return hed
    }
    
    
    
    
}
