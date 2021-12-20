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
    let horizontalStackView = UIStackView()
    let verticalStackView = UIStackView()
    let oneView = UIView()
    let oneButton = UIButton()
    let twoButton = UIButton()
    let enterButton = UIButton()
    let textField = UITextField()
    var complition: ((String) -> ())?
    var defaultText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ChooseColorViewController"
        view.backgroundColor = .lightGray.withAlphaComponent(0.8)
        
        initTwoButton()
        initOneView()
        initOneButton()
        initHorizontalStackView()
        initVerticalStackView()
        
        enterButton.backgroundColor = .white.withAlphaComponent(0.1)
        enterButton.setTitle("Set Title", for: .normal)
        enterButton.addTarget(self, action: #selector(SetTitle), for: .touchUpInside)
        textField.backgroundColor = .white.withAlphaComponent(0.1)
        textField.text = defaultText
    }
    
    @objc private func SetTitle() {
        complition?(textField.text!)
    }
    
    private func initHorizontalStackView() {
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(oneView)
        horizontalStackView.addArrangedSubview(oneButton)
        horizontalStackView.addArrangedSubview(twoButton)

        [horizontalStackView, oneView, oneButton, twoButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        horizontalStackView.alignment = .fill
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 15
        
        NSLayoutConstraint.activate([
            oneView.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            oneView.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            
            oneButton.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            oneButton.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            
            twoButton.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            twoButton.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalStackView.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            horizontalStackView.widthAnchor.constraint(lessThanOrEqualToConstant: view.bounds.width)
        ])

    }
    
    private func initVerticalStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(enterButton)
        verticalStackView.addArrangedSubview(textField)
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 15
        verticalStackView.alignment = .center
        verticalStackView.distribution = .equalCentering
        
        [verticalStackView, enterButton, textField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            verticalStackView.bottomAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: -50),
            verticalStackView.widthAnchor.constraint(lessThanOrEqualToConstant: view.bounds.width),
            verticalStackView.heightAnchor.constraint(lessThanOrEqualToConstant: view.bounds.height/2),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            enterButton.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5),
            enterButton.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            
            textField.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5),
            textField.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func initOneView() {
        
        oneView.backgroundColor = .magenta
        oneView.layer.borderWidth = 6
        oneView.layer.borderColor = UIColor.white.cgColor
        oneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
    }
    
    private func initOneButton() {
        
        oneButton.backgroundColor = .systemYellow
        oneButton.layer.borderWidth = 6
        oneButton.layer.borderColor = UIColor.white.cgColor
        oneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
    }
    
    private func initTwoButton() {
        
        twoButton.backgroundColor = .systemGreen
        twoButton.layer.borderWidth = 6
        twoButton.layer.borderColor = UIColor.white.cgColor
        twoButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
    }
    
    @objc private func didChooseColor(_ gestureRecognizer: UITapGestureRecognizer) {
        view.backgroundColor = gestureRecognizer.view?.backgroundColor
        delegate?.editBackgrounColor(color: gestureRecognizer.view?.backgroundColor)
    }
}
