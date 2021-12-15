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
        vc.delegate = self
        
        view.addSubview(button)
        button.layer.cornerRadius = view.bounds.width/4
        button.titleLabel?.font = .systemFont(ofSize: view.bounds.width/10, weight: .bold)
        button.frame = CGRect(x: 0, y: 0, width: view.bounds.width/2, height: view.bounds.width/2)
        button.center = view.center
        title = "SampleDelegateViewController"
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(didTappedRightBarButtonItem))
    }
    
    @objc private func didTappedRightBarButtonItem() {
        navigationController?.pushViewController(vc, animated: false)
    }
    
}

extension SampleDelegateViewController: SampleDelegate {
    func editColor(color: UIColor?) {
        view.backgroundColor = color
        button.backgroundColor = color
    }
    
    func editBackgrounColor(color: UIColor?) {
        view.backgroundColor = color
        button.backgroundColor = color
    }
}

protocol SampleDelegate: AnyObject {
    func editBackgrounColor(color: UIColor?)
    func editColor(color: UIColor?)
}

class ChooseColorViewController: UIViewController {
    
    weak var delegate: SampleDelegate?
    let oneView = UIView()
    
    let oneButton: UIView = {
        let button = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .systemPink
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
//        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    let twoButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
//        button.backgroundColor = .green
//        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
//        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(oneButton)
        view.addSubview(oneView)
//        view.addSubview(twoButton)
        oneButton.center = view.center
        oneView.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
        oneView.backgroundColor = .magenta
        oneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
    }
    
    @objc func didChooseColor(_ gestureRecognizer: UITapGestureRecognizer) {
//        let color = gestureRecognizer.view?.backgroundColor
        view.backgroundColor = gestureRecognizer.view?.backgroundColor
        delegate?.editBackgrounColor(color: gestureRecognizer.view?.backgroundColor)
    }
    
    @objc private func editColor() {
        delegate?.editColor(color: view.backgroundColor)
        print("tap")
    }
}
