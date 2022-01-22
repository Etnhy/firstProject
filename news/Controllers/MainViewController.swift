//
//  MainViewController.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var headerViewHeight: NSLayoutConstraint!
    
    lazy var headerView: MainHeaderView = {
        let view = MainHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        view.reloadButton.addTarget(nil, action: #selector(didTapReloadButton), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        setupViews()
        addSubviews()
        activateConstraints()
        
        

    }
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        headerViewHeight.constant = 60 + view.safeAreaInsets.top
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
    }
    
    
    private func addSubviews() {
        view.addSubview(headerView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        headerViewHeight = headerView.heightAnchor.constraint(equalToConstant: 60 + view.safeAreaInsets.top)
        headerViewHeight.isActive = true
    }

    
    //MARK: Actions
    @objc func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapReloadButton() {
        print("test ")
    }
    
}

//MARK: - UIGestureRecognizerDelegate
extension MainViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if(navigationController!.viewControllers.count > 1){
            return true
        }
        return false
    }
}

