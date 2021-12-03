//
//  ButtonsViewControoller.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 29.11.2021.
//

import UIKit

class ButtonsViewControoller: UIViewController {
    
    private let stackView = UIStackView()
    private let oneButton = UIButton()
    private let twoButton = UIButton()
    private let threeButton = UIButton()
    private let fourButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        initStackView()
        initOneButton()
        initTwoButton()
        initThreeButton()
        initFourButton()
        layoutConstraints()
    }
    
    private func initStackView() {
        stackView.addArrangedSubview(oneButton)
        stackView.addArrangedSubview(twoButton)
        stackView.addArrangedSubview(threeButton)
        stackView.addArrangedSubview(fourButton)
        
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        [stackView, oneButton, twoButton, threeButton, fourButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func initOneButton() {
        oneButton.layer.cornerRadius = 30
        oneButton.setTitle("One Button", for: .normal)
        oneButton.setTitleColor(.white, for: .normal)
        oneButton.titleLabel?.font = UIFont(name: "Optima Bold", size: 22)
        oneButton.backgroundColor = .red
        oneButton.addTarget(self, action: #selector(goToOneView), for: .touchUpInside)
    }
    
    private func initTwoButton() {
        twoButton.layer.cornerRadius = 30
        twoButton.setTitle("Two Button", for: .normal)
        twoButton.setTitleColor(.white, for: .normal)
        twoButton.titleLabel?.font = UIFont(name: "Optima Bold", size: 22)
        twoButton.backgroundColor = .blue
        twoButton.addTarget(self, action: #selector(goToTwoView), for: .touchUpInside)
    }
    
    private func initThreeButton() {
        threeButton.layer.cornerRadius = 30
        threeButton.setTitle("Three Button", for: .normal)
        threeButton.setTitleColor(.black, for: .normal)
        threeButton.titleLabel?.font = UIFont(name: "Optima Bold", size: 22)
        threeButton.backgroundColor = .green
        threeButton.addTarget(self, action: #selector(goToThreeView), for: .touchUpInside)
    }
    
    private func initFourButton() {
        fourButton.layer.cornerRadius = 30
        fourButton.setTitle("Four Button", for: .normal)
        fourButton.setTitleColor(.white, for: .normal)
        fourButton.titleLabel?.font = UIFont(name: "Optima Bold", size: 22)
        fourButton.backgroundColor = .purple
        fourButton.addTarget(self, action: #selector(goToFourView), for: .touchUpInside)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 900),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            oneButton.heightAnchor.constraint(equalToConstant: 80),
            oneButton.widthAnchor.constraint(equalToConstant: 240),
            
            twoButton.heightAnchor.constraint(equalToConstant: 80),
            twoButton.widthAnchor.constraint(equalToConstant: 240),
            
            threeButton.heightAnchor.constraint(equalToConstant: 80),
            threeButton.widthAnchor.constraint(equalToConstant: 240),
            
            fourButton.widthAnchor.constraint(equalToConstant: 240),
            fourButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc private func goToOneView() {
        let vc = OneViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func goToTwoView() {
        let vc = TwoViewController()
        navigationController?.pushViewController(vc, animated: false)
    }

    @objc private func goToThreeView() {
        let vc = ThreeViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func goToFourView() {
        let vc = FourViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
