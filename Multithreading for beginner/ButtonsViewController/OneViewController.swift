//
//  OneViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 29.11.2021.
//

import UIKit

class OneViewController: UIViewController {
    
    private let stackView = UIStackView()
    private let firstButton = UIButton()
    private let image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "OneViewController"
        view.backgroundColor = .red
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(image)
        
        [stackView, firstButton, image].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 500),
            
            firstButton.heightAnchor.constraint(equalToConstant: 80),
            firstButton.widthAnchor.constraint(equalToConstant: 240),
            
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        firstButton.backgroundColor = .green
        firstButton.setTitle("Download", for: .normal)
        firstButton.layer.cornerRadius = 30
        firstButton.addTarget(self, action: #selector(downloadImage), for: .touchUpInside)
        
        
        
        
        
        
    }
    
    @objc private func downloadImage() {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://wallpaperscave.ru/images/original/18/10-07/sci-fi-planets-90045.jpg") else {return}
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image.image = image
                }
            }
        }.resume()
    }
    
    
}
