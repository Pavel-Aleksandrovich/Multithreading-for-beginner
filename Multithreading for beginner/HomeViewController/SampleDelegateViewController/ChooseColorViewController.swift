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
    let oneView = UIView()
    let oneButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ChooseColorViewController"
        view.backgroundColor = .lightGray.withAlphaComponent(0.8)
        initOneView()
        initOneButton()
    }
    
    private func initOneView() {
        
        view.addSubview(oneView)
        
        oneView.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
        oneView.backgroundColor = .magenta
        oneView.layer.borderWidth = 6
        oneView.layer.borderColor = UIColor.white.cgColor
        oneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didChooseColor)))
    }
    
    private func initOneButton() {
        
        view.addSubview(oneButton)
        
        oneButton.frame = CGRect(x: 0, y: 300, width: 100, height: 100)
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
