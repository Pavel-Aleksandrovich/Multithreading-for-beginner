//
//  CustomCell.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 02.12.2021.
//

import UIKit

class ThreeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
