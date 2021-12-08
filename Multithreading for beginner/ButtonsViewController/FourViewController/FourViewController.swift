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
    
    private func initTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
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
extension FourViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mrArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return FourTableViewCell.init(title: mrArray[indexPath.row].title)
    }
    
}

class FourTableViewCell: UITableViewCell {
    
    private let titleLable = UILabel()
    private let stackView = UIStackView()
    
    
    private var title: String
    
    init(title: String) {
        self.title = title
        super.init(style: .default, reuseIdentifier: "cell")
        
        layoutConstraints()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutConstraints() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLable)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
//        stackView.spacing =
        
        [stackView, titleLable].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setData() {
        titleLable.text = title
    }
    
}
