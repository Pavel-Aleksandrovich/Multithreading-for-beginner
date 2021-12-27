//
//  ThreeDetailCell.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 27.12.2021.
//

import UIKit

class ThreeDetailCell: UITableViewCell {
    
    var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
//            titleLabel.topAnchor
        ])
    }
}
