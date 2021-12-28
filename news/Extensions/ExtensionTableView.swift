//
//  ExtensionTableView.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import Foundation
import UIKit



extension HomePageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "zчейка номер \(indexPath.row)"
        return cell
    }
    
    
    
    
    
}
