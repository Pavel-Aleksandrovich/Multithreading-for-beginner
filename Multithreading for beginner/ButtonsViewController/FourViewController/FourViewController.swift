//
//  FourViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 03.12.2021.
//

import UIKit

class FourViewController: UIViewController {
    
    private var mrArray = [Album]()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        title = "FourViewController"
        initTableView()
        
        ApiManager.shared.getAlbums { [weak self] albums in
            self?.mrArray = albums
            print(albums)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension FourViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mrArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return FourTableViewCell.init(title: mrArray[indexPath.row].title)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension FourViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vc = DetailFourViewController()
        vc.titleCell = mrArray[indexPath.row].title
        vc.idCell = mrArray[indexPath.row].id
        vc.userCell = mrArray[indexPath.row].userID
        vc.title = "\(indexPath.row)"
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension FourViewController {
    
    private func initTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
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
