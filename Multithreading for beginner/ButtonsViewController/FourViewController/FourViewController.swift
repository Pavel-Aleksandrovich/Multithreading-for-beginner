//
//  FourViewController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 03.12.2021.
//

import UIKit

class FourViewController: UIViewController {
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        title = "FourViewController"
        
//        ApiManager.shared.getUsers { user in
//            print(user)
//            print("seccess")
//        }
        
        ApiManager.shared.getPosts { post in
            print(post)
        }
        
//        makeRequest()
        
    }
//
//    private func makeRequest() {
//        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any") else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data) {
//                print(joke.setup)
//            }
//        }.resume()
//    }
    
}
