//
//  CustomAI.swift
//  ProjectNews
//
//  Created by Евгений Маглена on 23.12.2021.
//

import Foundation
import UIKit

fileprivate let SCREEN_WIDTH = UIScreen.main.bounds.size.width
fileprivate let SCREEN_HEIGHT = UIScreen.main.bounds.size.height


class CustomAI {
    static let shared: CustomAI = {
        let instance = CustomAI()
        return instance
    }()
    
    
    var container = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
    var activityIndicatorView = UIActivityIndicatorView()
    var blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    init() {
        //container
        container.backgroundColor = UIColor.clear
        //activityIndicator
        activityIndicatorView.hidesWhenStopped = true
        //blurEffect
        blurEffect.frame = container.bounds
        blurEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    class func showAI() {
        shared.show()
    }
    class func showBlurEffect() {
        shared.showWithBlurEffect()
    }
    class func hide() {
        shared.hide()
    }
    private func show() -> Void {
        container.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        container.backgroundColor = UIColor.black.withAlphaComponent(0.80)
        activityIndicatorView.style = .large
        activityIndicatorView.center = CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2)
        activityIndicatorView.color = UIColor.white
        activityIndicatorView.startAnimating()
        container.addSubview(activityIndicatorView)
        if let window = getKeyWindow() {
            window.addSubview(container)
        }
        container.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            self.container.alpha = 1.0
        })
    }
    
    func showWithBlurEffect() {
        container.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        if !UIAccessibility.isReduceTransparencyEnabled {
            container.backgroundColor = UIColor.clear
            container.addSubview(blurEffect)
        } else {
            container.backgroundColor = UIColor.white.withAlphaComponent(0.98)
        }
        if let window = getKeyWindow() {
            window.addSubview(container)
        }
        container.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            self.container.alpha = 1.0
        })
    }
    
    private func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.container.alpha = 0.0
        }) { finished in
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.removeFromSuperview()
            self.blurEffect.removeFromSuperview()
            self.container.removeFromSuperview()
        }
    }
    
    private func getKeyWindow() -> UIWindow? {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        return window
    }
}
