//
//  SampleDelegateViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 14.12.2021.
//

import UIKit

class SampleDelegateViewController: UIViewController {
    
    let vc = ChooseColorViewController()
    
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Change Color", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .bold)
        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = button.bounds.height/2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 6
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        view.addSubview(button)
        button.layer.cornerRadius = view.bounds.width/4
        button.titleLabel?.font = .systemFont(ofSize: view.bounds.width/20, weight: .bold)
        button.frame = CGRect(x: 0, y: 0, width: view.bounds.width/2, height: view.bounds.width/2)
        button.center = view.center
        title = "SampleDelegateViewController"
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(didTappedRightBarButtonItem))
    }
    
    @objc private func didTappedRightBarButtonItem() {
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func changeColor() {
        vc.view.backgroundColor = button.backgroundColor
    }
    
}

extension SampleDelegateViewController: SampleDelegate {
    
    func editBackgrounColor(color: UIColor?) {
        view.backgroundColor = color
        button.backgroundColor = color
    }
}
