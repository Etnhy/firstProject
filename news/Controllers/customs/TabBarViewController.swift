//
//  MainTabBatViewController.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController {
 
    
    let home = HomePageVC()
     let favorites = FavoritesVC()
     let profile = ProfileVC()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         configs()

     }
    func configs() {
        setNavControllers()
        UINavigationBar.appearance().prefersLargeTitles = true
        self.tabBar.backgroundColor = .black
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = UIColor.white
        UITabBar.appearance().barTintColor = .black
        }
     
     //MARK: creating
      func generalNavController(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
         let navController = UINavigationController(rootViewController: vc)
         //vc.navigationItem.title = title
         navController.title = title
         navController.tabBarItem.image = image
         return navController
     }
    
      func setNavControllers() { // контроллеры на таб бар
         
         let homeVC = generalNavController(vc: home, title: "Home",
                                           image: UIImage(imageLiteralResourceName: "home@25px.png"))
         let favoritesVC = generalNavController(vc: favorites, title: "Favorites",
                                                  image: UIImage(imageLiteralResourceName: "favorites@25px.png"))
         let accountVC = generalNavController(vc: profile, title: "Profile",
                                               image: UIImage(imageLiteralResourceName: "home@25px.png"))
         
         viewControllers = [homeVC, favoritesVC, accountVC]

     }
}
