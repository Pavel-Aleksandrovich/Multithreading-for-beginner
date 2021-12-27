//
//  ThreeDetailViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 27.12.2021.
//

import UIKit

class ThreeDetailViewController: UIViewController {
    
    private let tableView = UITableView()
    private let forCellReuseIdentifier = "cell"
    var threeArray = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(ThreeDetailCell.self, forCellReuseIdentifier: forCellReuseIdentifier)
        tableView.frame = view.bounds
        
    }
}
// MARK: - UITableViewDataSource

extension ThreeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        threeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: forCellReuseIdentifier, for: indexPath) as! ThreeDetailCell
        
        cell.titleLabel.text = threeArray[indexPath.row].title
        
        
        return cell
    }
    
    
}
