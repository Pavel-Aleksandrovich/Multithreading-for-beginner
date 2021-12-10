//
//  OneViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 29.11.2021.
//

import UIKit

class OneViewController: UIViewController {
    
    private let mainStackView = UIStackView()
    private let firstButton = UIButton()
    private let image = UIImageView()
    
    private let stackView = UIStackView()
    private let progressBar = UIProgressView()
    private let progressLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "OneViewController"
        view.backgroundColor = .red
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(firstButton)
        mainStackView.addArrangedSubview(image)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(progressBar)
        stackView.addArrangedSubview(progressLabel)
        
        [mainStackView, firstButton, image, stackView, progressBar, progressLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        mainStackView.alignment = .center
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 30
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 500),
            
            firstButton.heightAnchor.constraint(equalToConstant: 250),
            firstButton.widthAnchor.constraint(equalToConstant: 250),
            
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300),
            image.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: firstButton.centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 500),
            
            progressBar.heightAnchor.constraint(equalToConstant: 30),
            progressBar.widthAnchor.constraint(equalToConstant: 250),
            
            progressLabel.heightAnchor.constraint(equalToConstant: 50),
            progressLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        firstButton.backgroundColor = .green
        firstButton.setTitle("Download", for: .normal)
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.titleLabel?.font = .systemFont(ofSize: 40, weight: .semibold)
        firstButton.layer.cornerRadius = 125
        firstButton.addTarget(self, action: #selector(downloadImage), for: .touchUpInside)
        
        progressBar.progress = 0
        stackView.isHidden = true
    }
    
    @objc private func downloadImage() {
        stackView.isHidden = false
        
        firstButton.isHidden = true
        
        guard let url = URL(string: "https://wallpaperscave.ru/images/original/18/10-07/sci-fi-planets-90045.jpg") else {return}
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        
        session.downloadTask(with: url).resume()
    }
}
extension OneViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else { return }
        
        let image = UIImage(data: data)
        DispatchQueue.main.async { [ weak self ] in
            self?.image.image = image
            self?.stackView.isHidden = true
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async { [ weak self ] in
            self?.progressBar.progress = progress
            self?.progressLabel.lineBreakMode = .byClipping
            self?.progressLabel.text = "\(progress * 100) %"
        }
        
        
    }
}
