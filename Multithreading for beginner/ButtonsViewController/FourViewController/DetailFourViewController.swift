//
//  DetailFourViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 08.12.2021.
//

import UIKit

class DetailFourViewController: UIViewController {
    
    private let tableView = UITableView()
    var titleCell = String()
    var userCell = Int()
    var idCell = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
}

extension DetailFourViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return DetailCellFourViewController(title: titleCell, user: "\(userCell)", id: "\(idCell)")
    }
    
}

extension DetailFourViewController {
    
    private func initTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(FourTableViewCell.self, forCellReuseIdentifier: "sell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
