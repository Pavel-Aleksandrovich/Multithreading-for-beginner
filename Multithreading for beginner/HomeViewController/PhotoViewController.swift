//
//  PhotoViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 26.11.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private var alert = UIAlertController(title: nil, message: "Please Wait ...", preferredStyle: .alert)
    private lazy var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView()
        startActivityIndicator()
        initImage()
        loadPhoto()
    }
    
    private func createAlertActivityIndicator() {
        let loader = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loader.hidesWhenStopped = true
        loader.style = .large
        loader.startAnimating()
        alert.view.addSubview(loader)
        present(alert, animated: true, completion: nil)
    }
    
    private func startActivityIndicator() {
        createAlertActivityIndicator()
    }
    
    private func stopActivityIndicator() {
        alert.dismiss(animated: true, completion: nil)
    }
    
    private func loadingView() {
        view.backgroundColor = .systemBlue
        title = "PhotoViewController"
        
    }
    
    private func initImage() {
        image.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        view.addSubview(image)
        image.center = view.center
    }
    
    private func loadPhoto() {
        let imageURL = URL(string: "https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
        
        DispatchQueue.global(qos: .utility).async { [ weak self ] in
            if let data = try? Data(contentsOf: imageURL){
                DispatchQueue.main.async {
                    self?.image.image = UIImage(data: data)
                }
            }
        }
        stopActivityIndicator()
    }
    
}
