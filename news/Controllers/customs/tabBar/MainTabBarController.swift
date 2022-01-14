//
//  MainTabBarController.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    lazy var mainTabBar: MainTabBar = {
        let view = MainTabBar(imagesNamed:
                                ["home", "favorites","profile"])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVCs()
        configureTabBar()
        

    }
    func hideTabBar() {
        self.mainTabBar.isHidden = true
    }
    
    func showTabBar() {
        self.mainTabBar.isHidden = false
    }
    private func addVCs() {
        let home = MainHomeViewController()
        let favorites = FavoritesVC()
        let profile = ProfileVC()
        viewControllers = [createNavigationControllerFor(home),
                           createNavigationControllerFor(favorites),
                            createNavigationControllerFor(profile)]
        selectedIndex = 0 // default 0
    }
    
    private func createNavigationControllerFor(_ rootViewController: UIViewController) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.isNavigationBarHidden = true
        return navigationController
    }
    
    private func configureTabBar() {
            self.tabBar.isHidden = true
            addMainTabBar()
        }
        
        private func addMainTabBar() {
            self.view.addSubview(mainTabBar)
            mainTabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            mainTabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            mainTabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            mainTabBar.heightAnchor.constraint(equalToConstant: 94).isActive = true
            configureTabBarItems()
        }
        
        private func configureTabBarItems() {
            mainTabBar.items[0].titleLabel.text = "home".uppercased()
            mainTabBar.items[1].titleLabel.text = "favorites".uppercased()
            mainTabBar.items[2].titleLabel.text = "profile".uppercased()
        }
}
