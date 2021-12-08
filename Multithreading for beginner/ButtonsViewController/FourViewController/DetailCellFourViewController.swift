//
//  DetailCellFourViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 08.12.2021.
//

import UIKit

class DetailCellFourViewController: UITableViewCell {
    
    private let titleLable = UILabel()
    private let userLable = UILabel()
    private let idLable = UILabel()
    private let stackView = UIStackView()
    
    
    private var title: String
    private var user: String
    private var id: String
    
    init(title: String, user: String, id: String) {
        self.title = title
        self.user = user
        self.id = id
        super.init(style: .default, reuseIdentifier: "cell")
        
        layoutConstraints()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutConstraints() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLable)
        stackView.addArrangedSubview(userLable)
        stackView.addArrangedSubview(idLable)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        [stackView, titleLable, userLable, idLable].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setData() {
        titleLable.text = title
        userLable.text = user
        idLable.text = id
        
    }
    
}
