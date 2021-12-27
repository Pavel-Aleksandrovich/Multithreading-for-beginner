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
    private let plusImageView = UIImageView()
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
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        plusImageView.image = plusImage
        plusButton.setImage(plusImageView.image, for: .normal)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            plusButton.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            plusButton.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            plusImageView.widthAnchor.constraint(equalToConstant: 50),
            plusImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc private func tappedPlusButton() {
        showAlert()
    }
    
    private func showAlert() {
        createAlert(title: "Add post", message: nil, preferredStyle: .alert) { [ weak self ] post in
            self?.firstArray.append(post)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
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
// MARK: - UIAlertController

extension ThreeViewController {
    
    func createAlert(title: String, message: String?, preferredStyle: UIAlertController.Style,
                     complition: @escaping (Post) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let alertActionOk = UIAlertAction(title: "Ok", style: .default) { text in
            let firstText = alert.textFields?.first?.text
            let secondText = alert.textFields?[1].text
            let thirdText = alert.textFields?[2].text
            let fourthText = alert.textFields?[3].text
            
            guard let userId = firstText,
                  let postId = secondText,
                  let title = thirdText,
                  let body = fourthText
                  else {return}
            
            complition(Post(userId: Int(userId)!, postId: Int(postId)!, title: title, body: body))
        }
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField { text in
            text.placeholder = "Enter userId"
        }
        alert.addTextField { text in
            text.placeholder = "Enter postId"
        }
        alert.addTextField { text in
            text.placeholder = "Enter title"
        }
        alert.addTextField { text in
            text.placeholder = "Enter body"
        }
        
        alert.addAction(alertActionOk)
        alert.addAction(alertActionCancel)
        
        present(alert, animated: false, completion: nil)
    }
    
}

