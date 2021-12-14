//
//  SampleDelegateViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 14.12.2021.
//

import UIKit

class SampleDelegateViewController: UIViewController {
    
    
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Tap", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 40, weight: .bold)
        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = button.bounds.height/2
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        button.layer.cornerRadius = view.bounds.width/4
        button.titleLabel?.font = .systemFont(ofSize: view.bounds.width/10, weight: .bold)
        button.frame = CGRect(x: 0, y: 0, width: view.bounds.width/2, height: view.bounds.width/2)
        button.center = view.center
        title = "SampleDelegateViewController"
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(didTappedRightBarButtonItem))
    }
    
    @objc private func didTappedRightBarButtonItem() {
        let vc = ChooseColorViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
        print("t")
    }
    
}

extension SampleDelegateViewController: SampleDelegate {
    func editBackgrounColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    
}

protocol SampleDelegate: AnyObject {
    func editBackgrounColor(color: UIColor)
}

class ChooseColorViewController: UIViewController {
    
    weak var delegate: SampleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
