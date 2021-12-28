//
//  tabbar.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import Foundation
import UIKit


class ModelTabBarController: UITabBarController  {

    
   let home = HomePageVC()
    let favorites = FavoritesVC()
    let profile = ProfileVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavControllers()
        UINavigationBar.appearance().prefersLargeTitles = true
        self.tabBar.backgroundColor = .black
    }
    
    //MARK: actions
    fileprivate func generalNavController(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        //vc.navigationItem.title = title
        navController.title = title
        navController.tabBarItem.image = image
        return navController
    }
    private func setNavControllers() { // контроллеры на таб бар
        
        let homeVC = generalNavController(vc: home, title: "Home",
                                          image: UIImage(imageLiteralResourceName: "home@25px.png"))
        let favoritesVC = generalNavController(vc: favorites, title: "Interesting",
                                                 image: UIImage(imageLiteralResourceName: "favorites@25px.png"))
        let accountVC = generalNavController(vc: profile, title: "Settings",
                                              image: UIImage(imageLiteralResourceName: "home@25px.png"))
        
        viewControllers = [homeVC, favoritesVC, accountVC]

    }
}
