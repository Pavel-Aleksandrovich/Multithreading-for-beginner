//
//  ImageTableViewCell.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 03.12.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    private let image = UIImageView()
    private let link: String
    
    init(link: String) {
        self.link = link
        super.init(style: .default, reuseIdentifier: "cell")
        
        initialize()
        downloadImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
     private func downloadImage() {
        let session = URLSession.shared
        
        guard let url = URL(string: link) else {return}
        
        session.dataTask(with: url) { [ weak self ] (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image.image = image
                }
            }
        }.resume()
    }
}
