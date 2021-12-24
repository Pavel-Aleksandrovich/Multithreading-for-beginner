//
//  ThreeViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 29.11.2021.
//

import UIKit

class ThreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private var firstArray = [Post]()
    private let plusButton: UIButton = {
        let plusButton = UIButton()
        plusButton.backgroundColor = .green.withAlphaComponent(0.4)
        plusButton.addTarget(self, action: #selector(tappedPlusButton), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        return plusButton
    }()
    private let plusImage = UIImage(systemName: "heart.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obtainPosts()
        
        title = "ThreeViewController"
        view.backgroundColor = .green
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.addSubview(plusButton)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        plusButton.layer.cornerRadius = view.bounds.width/10
        plusButton.setImage(plusImage, for: .normal)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            plusButton.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            plusButton.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
    }
    
    @objc private func tappedPlusButton() {
        print("tappedPlusButton")
    }
    
    private func obtainPosts() {
        
        NetworkManager.shared.obtainPosts { [ weak self ] (result) in
            switch result {
            case .success(let post) :
                self?.firstArray = post
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error) :
            print("Error \(error.localizedDescription)")
            }
        }
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


