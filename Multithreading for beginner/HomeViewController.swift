//
//  ViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 18.11.2021.
//

import UIKit

class HomeViewController: UIViewController {

   private lazy var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView()
        initButton()
    }
    
    private func loadingView() {
        view.backgroundColor = .systemPink
        title = "HomeViewController"
    }

    func initButton() {
        button.frame = CGRect(x: 0, y: 0, width: 240, height: 80)
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.setTitle("Go to Photo", for: .normal)
        button.addTarget(self, action: #selector(goToPhotoViewController), for: .touchUpInside)
        view.addSubview(button)
        button.center = view.center
    }
    
    @objc private func goToPhotoViewController() {
        let vc = PhotoViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

class PhotoViewController: UIViewController {
    
    private lazy var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView()
        initImage()
        loadPhoto()
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
        let imageURL: URL = URL(string: "https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
        
        DispatchQueue.global(qos: .utility).async { [ weak self ] in
            if let data = try? Data(contentsOf: imageURL){
                DispatchQueue.main.async {
                    self?.image.image = UIImage(data: data)
                }
            }
        }
    }
    
}
