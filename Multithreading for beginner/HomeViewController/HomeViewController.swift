//
//  ViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 18.11.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var button = UIButton()
    var navController = UINavigationController()
    
    private var twoButton: UIButton = {
      let twoButton = UIButton()
        twoButton.backgroundColor = .orange
        twoButton.setTitle("Tap ", for: .normal)
        twoButton.layer.cornerRadius = 20
        twoButton.addTarget(self, action: #selector(goToPictureViewController), for: .touchUpInside)
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        return twoButton
    }()
    
    private let threeButton: UIButton = {
        let threeButton = UIButton()
        threeButton.setTitle("Table View", for: .normal)
        threeButton.backgroundColor = .magenta
        threeButton.layer.cornerRadius = 20
        threeButton.addTarget(self, action: #selector(goToTableView), for: .touchUpInside)
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        return threeButton
    }()
//    
//    init(navController: UINavigationController) {
//        self.navController = navController
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initButton()
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        loadingView()
        
    }
    
    @objc private func goToTableView() {
        let vc = TableViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func goToPictureViewController() {
        let vc = PictureViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func loadingView() {
        view.backgroundColor = .systemPink
        title = "HomeViewController"
        
        NSLayoutConstraint.activate([
            twoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            twoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            twoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            twoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            twoButton.heightAnchor.constraint(equalToConstant: 80),
            
            threeButton.centerYAnchor.constraint(equalTo: twoButton.centerYAnchor, constant: 100),
            threeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            threeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            threeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            threeButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func initButton() {
        button.frame = CGRect(x: 0, y: 0, width: 240, height: 80)
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.setTitle("Go to Photo", for: .normal)
        button.addTarget(self, action: #selector(goToPhotoViewController), for: .touchUpInside)
        view.addSubview(button)
        button.center = view.center
    }
    
    @objc private func goToPhotoViewController() {
        let vc = PhotoViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}


