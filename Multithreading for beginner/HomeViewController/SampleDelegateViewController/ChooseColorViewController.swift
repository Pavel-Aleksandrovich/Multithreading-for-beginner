//
//  ChooseColorViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 15.12.2021.
//

import UIKit

protocol SampleDelegate: AnyObject {
    func editBackgrounColor(color: UIColor?)
}

class ChooseColorViewController: UIViewController {
    
    weak var delegate: SampleDelegate?
    let stackView = UIStackView()
    let oneView = UIView()
    let oneButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ChooseColorViewController"
        view.backgroundColor = .lightGray.withAlphaComponent(0.8)
        
        initOneView()
        initOneButton()
        initStackView()
    }
    
    private func initStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(oneView)
        stackView.addArrangedSubview(oneButton)

        [stackView, oneView, oneButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        
        NSLayoutConstraint.activate([
            oneView.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            oneView.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            
            oneButton.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            oneButton.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            stackView.widthAnchor.constraint(equalToConstant: 2*view.bounds.width/5 + stackView.spacing)
        ])

    }
    
    private func initOneView() {
        
//        view.addSubview(oneView)
//        oneView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        oneView.backgroundColor = .magenta
        oneView.layer.borderWidth = 6
        oneView.layer.borderColor = UIColor.white.cgColor
        oneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
    }
    
    private func initOneButton() {
        
//        view.addSubview(oneButton)
//        oneButton.frame = CGRect(x: view.center, y: 0, width: 100, height: 100)
        oneButton.backgroundColor = .systemYellow
        oneButton.layer.borderWidth = 6
        oneButton.layer.borderColor = UIColor.white.cgColor
        oneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
    }
    
    @objc private func didChooseColor(_ gestureRecognizer: UITapGestureRecognizer) {
        view.backgroundColor = gestureRecognizer.view?.backgroundColor
        delegate?.editBackgrounColor(color: gestureRecognizer.view?.backgroundColor)
    }
}
