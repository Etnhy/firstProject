//
//  CollectionViewDelegate.swift
//  news
//
//  Created by Евгений Маглена on 02.01.2022.
//

import Foundation
import UIKit
import SafariServices


extension CollectionNewsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height / 2)
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionNewsCell.identifier, for: indexPath) as? CollectionNewsCell else {
            fatalError()
        }
        let color = MyColors()
        cell.backgroundColor = color.color1Dark
        cell.configure(with: viewModels[indexPath.item])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articles = articles[indexPath.item]
        
        guard let url = URL(string: articles.url ?? " ") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    

    
}
