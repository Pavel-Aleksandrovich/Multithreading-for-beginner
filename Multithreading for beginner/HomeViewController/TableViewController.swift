//
//  TableViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 26.11.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    private let reuseIdentifirer = "cell"
    var array = [String]()
    
    let key = "0288b3dc9adeb826ad06e4670947341d"
    let url = "http://data.fixer.io/api/latest"
    let base = "EUR"
    let symbols = "USD, RUB, AMD"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: reuseIdentifirer)
//        title = "TableViewController"
        
        let parameters = ["access_key": key,
                          "base": base,
                          "symbols": symbols
                         ]
        
        fetRequest(url: url, parameters: parameters)
    }

    private func fetRequest(url: String, parameters: [String: String]) {
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.title = "\(json["date"]) \(json["base"])"
                
                self.updatePrices(json: json)
                
                print(json)
            case .failure(let error):
                print(error)
            }
            self.tableView.reloadData()
        }
    }
    
    private func updatePrices(json: JSON) {
        for (name, price) in json["rates"] {
            let curr = "\(name)  \(price)"
            array.append(curr)
        }
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
