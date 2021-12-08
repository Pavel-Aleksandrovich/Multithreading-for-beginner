//
//  FourTableViewCell.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 08.12.2021.
//

import UIKit

class FourTableViewCell: UITableViewCell {
    
    private let titleLable = UILabel()
    private let stackView = UIStackView()
    
    
    private var title: String
    
    init(title: String) {
        self.title = title
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
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
//        stackView.spacing = 20
        
        [stackView, titleLable].forEach {
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
    }
    
}
