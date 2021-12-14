//
//  ViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 18.11.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var button = UIButton()
    private let stackView = UIStackView()
    
    private var twoButton: UIButton = {
      let twoButton = UIButton()
        twoButton.backgroundColor = .orange
        twoButton.setTitle("Picture View Controller", for: .normal)
        twoButton.setTitleColor(.white, for: .normal)
        twoButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        twoButton.layer.cornerRadius = 20
        twoButton.addTarget(self, action: #selector(goToPictureViewController), for: .touchUpInside)
        return twoButton
    }()
    
    private let threeButton: UIButton = {
        let threeButton = UIButton()
        threeButton.setTitle("Table View Controller", for: .normal)
        threeButton.backgroundColor = .magenta
        threeButton.setTitleColor(.white, for: .normal)
        threeButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        threeButton.layer.cornerRadius = 20
        threeButton.addTarget(self, action: #selector(goToTableView), for: .touchUpInside)
        return threeButton
    }()
    
    private let fourButton: UIButton = {
        let threeButton = UIButton()
        threeButton.setTitle("Delegate View Controller", for: .normal)
        threeButton.backgroundColor = .white
        threeButton.setTitleColor(.red, for: .normal)
        threeButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        threeButton.layer.cornerRadius = 20
        threeButton.addTarget(self, action: #selector(goDelegate), for: .touchUpInside)
        return threeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initButton()
        loadingView()
        initStackView()
        setConstraints()
    }
    
    private func loadingView() {
        view.backgroundColor = .systemPink
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(twoButton)
        stackView.addArrangedSubview(threeButton)
        stackView.addArrangedSubview(fourButton)
    }
    
    private func initStackView() {
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        
        [stackView, button, twoButton, threeButton, fourButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func initButton() {
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.setTitle("Photo View Controller", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goToPhotoViewController), for: .touchUpInside)
    }
    
    @objc private func goToPhotoViewController() {
        let vc = PhotoViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func goToTableView() {
        let vc = TableViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func goToPictureViewController() {
        let vc = PictureViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func goDelegate() {
        let vc = TestDelegatViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 800),
            
            button.widthAnchor.constraint(equalToConstant: 240),
            button.heightAnchor.constraint(equalToConstant: 80),
            
            twoButton.widthAnchor.constraint(equalToConstant: 240),
            twoButton.heightAnchor.constraint(equalToConstant: 80),
            
            threeButton.widthAnchor.constraint(equalToConstant: 240),
            threeButton.heightAnchor.constraint(equalToConstant: 80),
            
            fourButton.widthAnchor.constraint(equalToConstant: 240),
            fourButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}


