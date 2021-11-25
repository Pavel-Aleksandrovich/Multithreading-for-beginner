//
//  PictureViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 25.11.2021.
//

import UIKit
import Alamofire

class PictureViewController: UIViewController {
    
    private let image = UIImageView()
    let imageUrl = "https://cdn.nwmgroups.hu/s/img/i/1603/20160318hiperorias-csillaghalmaz.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PictureViewController"
        view.backgroundColor = .green
        initImage()
        loadImage(imageUrl: imageUrl)
    }
    private func initImage() {
        image.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        view.addSubview(image)
        image.center = view.center
    }
    
    private func loadImage(imageUrl: String) {
        AF.download(imageUrl).responseData { (response) in
            if let data = response.value {
                let imageData = UIImage(data: data)
                self.image.image = imageData
            }
        }
    }
}





































