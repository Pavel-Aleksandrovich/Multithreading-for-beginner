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
        return DetailCellFourViewController(title: titleCell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
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

class DetailCellFourViewController: UITableViewCell {
    
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
//        stackView.spacing = 20
        
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
