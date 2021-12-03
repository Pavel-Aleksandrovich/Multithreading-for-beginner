//
//  TwoViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 29.11.2021.
//

import UIKit

class TwoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView = UITableView()
    private let imageArray:[String] = [
        "https://i.artfile.ru/2560x1600_486677_[www.ArtFile.ru].jpg",
        "https://i.artfile.ru/1920x1080_913850_[www.ArtFile.ru].jpg",
        "https://www.culture.ru/storage/images/a4247ecb83d91aad3888641ceb86994b/c9dbf3637b6e163faa41aa3360dc06d9.jpeg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TwoViewController"
//        view.backgroundColor = .blue
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.isPagingEnabled = true
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ImageTableViewCell.init(link: imageArray[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}







































