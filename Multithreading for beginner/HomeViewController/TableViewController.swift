//
//  TableViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 26.11.2021.
//

import UIKit

class TableViewController: UITableViewController {
    private let reuseIdentifirer = "cell"
    let array = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let nib = UINib(nibName: "cell", bundle: nil)
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: reuseIdentifirer)
        title = "TableViewController"
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifirer, for: indexPath)

        cell.textLabel?.text = array[indexPath.row]

        return cell
    }

  

}
