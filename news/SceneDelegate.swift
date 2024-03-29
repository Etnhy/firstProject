//
//  SceneDelegate.swift
//  news
//
//  Created by Евгений Маглена on 26.12.2021.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
//        guard let windowScreen = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScreen)
//        let reg = RegistrationViewController()
//        window?.rootViewController = MainTabBarController()
//        window?.makeKeyAndVisible()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        setRootViewController2()
        
        NotificationCenter.default.addObserver(forName: .CurrentDidChange, object: nil, queue: OperationQueue.main) { _ in
            self.setRootViewController2()
        }
    }
}


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        CustomAI.hide()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        CustomAI.showBlurEffect()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()

    }




extension SceneDelegate {
    func setRootViewController() {
        //            if let mainController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController {
        let mainController = MainTabBarController()
        window?.rootViewController = mainController
        window?.makeKeyAndVisible()
    }
    
    
    func setRootViewController2() {
        if let _ = UserDefaults.standard.value(forKey: "currentUser") as? String {
//        if Auth.auth().currentUser?.uid != nil {
            let mainController = MainTabBarController()
            window?.rootViewController = mainController
            window?.makeKeyAndVisible()
            UIView.transition(with: window!,
                              duration: 0.8,
                              options: .transitionFlipFromBottom,
                              animations: nil,
                              completion: nil)
            
        } else {
            let mainController = loginViewController()
            window?.rootViewController = mainController
            window?.makeKeyAndVisible()
            UIView.transition(with: window!,
                              duration: 0.8,
                              options: .transitionFlipFromBottom,
                              animations: nil,
                              completion: nil)
            
        }
    }

}
