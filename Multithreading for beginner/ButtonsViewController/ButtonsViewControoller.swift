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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(oneButton)
        stackView.addArrangedSubview(twoButton)
        stackView.addArrangedSubview(threeButton)
        
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        [stackView, oneButton, twoButton, threeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 600),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            oneButton.heightAnchor.constraint(equalToConstant: 80),
            oneButton.widthAnchor.constraint(equalToConstant: 240),
            
            twoButton.heightAnchor.constraint(equalToConstant: 80),
            twoButton.widthAnchor.constraint(equalToConstant: 240),
            
            threeButton.heightAnchor.constraint(equalToConstant: 80),
            threeButton.widthAnchor.constraint(equalToConstant: 240)
        ])
        
//        oneButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        oneButton.layer.cornerRadius = 30
        oneButton.backgroundColor = .gray
        
//        twoButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        twoButton.backgroundColor = .blue
        
//        threeButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        threeButton.backgroundColor = .green
    }
    

}
