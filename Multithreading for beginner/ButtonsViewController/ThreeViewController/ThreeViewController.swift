//
//  ThreeViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 29.11.2021.
//

import UIKit

class ThreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var firstArray = [Post]()
    private var secondArray: [String] = ["", ""]
    private let tableView = UITableView()
    private let decoder = JSONDecoder()
    
    private let sessionConfiguration = URLSessionConfiguration.default
    private let session = URLSession.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obtainPosts()
        
        title = "ThreeViewController"
        view.backgroundColor = .green
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
       
        
    }
    
    private func obtainPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        session.dataTask(with: url) { [ weak self ] data, response, error in
            if error == nil, let parsData = data {
                
                guard let post = try? self?.decoder.decode([Post].self, from: parsData) else {return}
                self?.firstArray = post
                print(post)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } else {
                print ("Error: \(error?.localizedDescription)")
            }
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let post = firstArray[indexPath.row]
        
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


