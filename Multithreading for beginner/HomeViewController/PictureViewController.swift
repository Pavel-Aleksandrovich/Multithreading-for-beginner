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
    let imageUrl = "https://cdn.nwmgroups.hu/s/img/i/1603/20160318hiperorias-csillaghalmaz.jpg"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initProgressLabel()
        startLoader()
        loadImage(imageUrl: imageUrl)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PictureViewController"
        view.backgroundColor = .green
        initImage()
        
    }
    private func initProgressLabel() {
        progressLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        view.addSubview(progressLabel)
        progressLabel.center = view.center
    }
    
    private func startLoader() {
        progressView.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        view.addSubview(progressView)
        progressView.center = view.center
        progressView.translatesAutoresizingMaskIntoConstraints = false
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





































