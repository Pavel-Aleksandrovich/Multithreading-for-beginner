//
//  PictureViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 25.11.2021.
//

import UIKit
import Alamofire

class PictureViewController: UIViewController {
    
    private let progressView = UIProgressView()
    private let progressLabel = UILabel()
    private let image = UIImageView()
    private let stackView = UIStackView()
    let imageUrl = "https://cdn.nwmgroups.hu/s/img/i/1603/20160318hiperorias-csillaghalmaz.jpg"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadImage(imageUrl: imageUrl)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PictureViewController"
        view.backgroundColor = .green
        initImage()
        startLoading()
        initConstraint()
    }
    
    private func initConstraint() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 500),
            
            progressView.widthAnchor.constraint(equalToConstant: 300),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            
            progressLabel.widthAnchor.constraint(equalToConstant: 150),
            progressLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func startLoading() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(progressLabel)
        stackView.addArrangedSubview(progressView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    private func initImage() {
        image.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        view.addSubview(image)
        image.center = view.center
    }
    
    private func loadImage(imageUrl: String) {
        AF.download(imageUrl)
            .downloadProgress { progress in
                self.progressLabel.text = progress.localizedDescription
                self.progressView.setProgress(Float(progress.fractionCompleted), animated: true)
            }
            
            .responseData { (response) in
                if let data = response.value {
                    let imageData = UIImage(data: data)
                    self.image.image = imageData
                }
                self.progressView.isHidden = true
                self.progressLabel.isHidden = true
            }
    }
}





































