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
        initStackView()
        
        view.addSubview(textField)
        view.addSubview(enterButton)
//        textField.translatesAutoresizingMaskIntoConstraints = false
        enterButton.backgroundColor = .white.withAlphaComponent(0.1)
        enterButton.setTitle("Set Title", for: .normal)
        enterButton.addTarget(self, action: #selector(SetTitle), for: .touchUpInside)
        
        enterButton.frame = CGRect(x: view.bounds.width/4, y: 100, width: 3*view.bounds.width/5, height: 80)
        
        textField.frame = CGRect(x: view.bounds.width/4, y: 200, width: 3*view.bounds.width/5 + 2*stackView.spacing, height: 20)
        textField.backgroundColor = .white.withAlphaComponent(0.1)
        textField.text = defaultText
    }
    
    @objc private func SetTitle() {
        complition?(textField.text!)
    }
    
    private func initStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(oneView)
        stackView.addArrangedSubview(oneButton)
        stackView.addArrangedSubview(twoButton)

        [stackView, oneView, oneButton, twoButton].forEach{
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
            
            twoButton.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            twoButton.widthAnchor.constraint(equalToConstant: view.bounds.width/5),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.width/5),
            stackView.widthAnchor.constraint(equalToConstant: 3*view.bounds.width/5 + 2*stackView.spacing)
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
