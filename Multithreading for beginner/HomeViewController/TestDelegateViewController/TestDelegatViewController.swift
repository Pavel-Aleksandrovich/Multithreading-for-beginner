//
//  TestDelegatViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 14.12.2021.
//

import UIKit

class TestDelegatViewController: UIViewController, NotificationDelegate {
    
    private let notificationView = NotificationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TestDelegatViewController"
        view.backgroundColor = .lightGray
        
        view.addSubview(notificationView)
        notificationView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        notificationView.frame = CGRect(x: 20, y: 10, width: view.bounds.width, height: view.bounds.width)
    }
    
    func buttonDidTapped() {
        notificationView.label.text = "button tapped"
    }
}

protocol NotificationDelegate: AnyObject {
    func buttonDidTapped()
}

class NotificationView: UIView {
    
    weak var delegate: NotificationDelegate?
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bell")
        image.tintColor = .blue
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Some Text"
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Some Title", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .heavy)
        button.layer.cornerRadius = 20
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonDidTapped() {
        delegate?.buttonDidTapped()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: bounds.size.width/6, y: 30, width: bounds.size.width/2, height: bounds.size.width/2)
        label.frame = CGRect(x: bounds.size.width/6, y: imageView.bounds.height + 20, width: bounds.size.width/2, height: 30)
        button.frame = CGRect(x: bounds.size.width/6, y: imageView.bounds.height + 50 + label.bounds.height , width: bounds.size.width/2, height: 60)
    }
}



































