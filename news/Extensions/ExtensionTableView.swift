//
//  ExtensionTableView.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import Foundation
import UIKit


extension MainTableViewViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        cell.textLabel?.text =  "новостная ячейка \(indexPath.row)"
        

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300//UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    
    
}


//extension TableViewCell: UITableViewCell
