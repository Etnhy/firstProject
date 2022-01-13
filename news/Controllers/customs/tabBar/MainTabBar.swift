//
//  MainTabBar.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import UIKit

protocol MainTabBarDelegate: AnyObject {
    func mainTabBar(_ selectedIndex: Int)
}

class MainTabBar: UIView {
    
    weak var delegate: MainTabBarDelegate?
    
    lazy var items: [MainTabBarItem] = {
        var views: [MainTabBarItem] = []
        for (index, imageNamed) in imagesNamed.enumerated() {
            let view = MainTabBarItem()
            view.index = index
//            view.imageView.image = UIImage(named: imageNamed)?.withTintColor(UIColor.brown.withAlphaComponent(0.2))
            view.imageView.image = UIImage(named: imageNamed)?.withTintColor(UIColor.brown.withAlphaComponent(0.2))
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapItem(_:))))
            views.append(view)
        }
        views[0].isSelected = true
        return views
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: items)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
//        stackView.backgroundColor = MyColors.myColor.color2leastDark
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    private var shapeLayer: CALayer?
    
    let imagesNamed: [String]
    
    init (imagesNamed: [String]) {
        self.imagesNamed = imagesNamed
        super.init(frame: .zero)
        addSubviews()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
    
    private func addSubviews() {
        addSubview(stackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            //            stackView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.white.cgColor//UIColor.init(netHex: 0xAFAFED).cgColor
        shapeLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        shapeLayer.shadowOffset = CGSize(width: 0.0, height: -1.0)
        shapeLayer.shadowRadius = 8.0
        shapeLayer.shadowOpacity = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let radius: CGFloat = 16
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: radius)) // start top left
        path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: angle(180), endAngle: angle(270), clockwise: true)
        path.addLine(to: CGPoint(x: self.frame.width - radius, y: 0))
        path.addArc(withCenter: CGPoint(x: self.frame.width - radius, y: radius), radius: radius, startAngle: angle(270), endAngle: angle(0), clockwise: true)
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
        
        //        let path = UIBezierPath()
        //        path.move(to: CGPoint(x: 20, y: 0)) // start top left
        //        path.addLine(to: CGPoint(x: self.frame.width - 20, y: 0))
        //        path.addLine(to: CGPoint(x: self.frame.width - 20, y: self.frame.height - 20))
        //        path.addLine(to: CGPoint(x: 20, y: self.frame.height - 20))
        //        path.close()
        //        return path.cgPath
    }
    
    private func angle(_ degree: Double) -> CGFloat {
        return CGFloat(Double.pi * degree / 180.0)
    }
    
    func setSelectedIndex(_ selectedIndex: Int) {
        for (index, item) in items.enumerated() {
            if index == selectedIndex {
                item.isSelected = true
                delegate?.mainTabBar(item.index!)
            } else {
                if item.index != nil {
                    item.isSelected = false
                }
            }
        }
    }
    
    //MARK: - Actions
    @objc func didTapItem(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view as? MainTabBarItem else {return}
        
        for (_, item) in self.items.enumerated() {
            if item == view {
                item.isSelected = true
                delegate?.mainTabBar(item.index!)
            } else {
                if item.index != nil {
                    item.isSelected = false
                }
            }
        }
    }
}
//MARK: - MainTabBarItem
class MainTabBarItem: UIView {
    var index: Int?
    
    var isSelected: Bool = false {
        didSet {
            view.isHidden = isSelected ? false : true
            imageView.image = imageView.image?.withTintColor(isSelected ? .black : UIColor.brown.withAlphaComponent(0.2))
            titleLabel.textColor = isSelected ? .brown : UIColor.brown.withAlphaComponent(0.2)
        }
    }
    
//    lazy var view: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .brown.withAlphaComponent(0.1)
//        view.isHidden = true
//        view.layer.cornerRadius = 14
//        return view
//    }()
    
        lazy var view: UIView = { // полосочка у кнопок
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .red
            view.isHidden = true
            view.layer.cornerRadius = 2
            return view
        }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.font = .systemFont(ofSize: 12)
        view.textColor = UIColor.brown.withAlphaComponent(0.2)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        addSubview(view)
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
//    private func activateConstraints() {
//        NSLayoutConstraint.activate([
//            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//            view.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
//            view.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 0),
//            view.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 0),
//            view.heightAnchor.constraint(equalToConstant: 28),
//            view.widthAnchor.constraint(equalToConstant: 28),
//            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
//            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
//            imageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 0),
//            imageView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 0),
//            imageView.heightAnchor.constraint(equalToConstant: 20),
//            imageView.widthAnchor.constraint(equalToConstant: 20),
//
//            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
//            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0),
//            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 0),
//            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 0),
//            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//        ])
//    }
    
        private func activateConstraints() {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                view.heightAnchor.constraint(equalToConstant: 4),
    
                imageView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 8),
                imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
                imageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 0),
                imageView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 0),
                imageView.heightAnchor.constraint(equalToConstant: 20),
                imageView.widthAnchor.constraint(equalToConstant: 20),
    
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0),
                titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 0),
                titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 0),
                titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            ])
        }
    
}
//MARK: MainTabBarDelegate
extension MainTabBarController: MainTabBarDelegate {
    func mainTabBar(_ selectedIndex: Int) {
        self.selectedIndex = selectedIndex
    }
    
    
}
