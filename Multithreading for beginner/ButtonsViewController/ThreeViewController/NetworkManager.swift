//
//  NetworkManager.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 02.12.2021.
//

import Foundation

 enum ObtainPostResult {
    case success(post: [Post])
    case failure(error: Error)
}

class NetworkManager {
    
    private let decoder = JSONDecoder()
    
    private let sessionConfiguration = URLSessionConfiguration.default
    private let session = URLSession.shared
    
    func obtainPosts(completion: @escaping (ObtainPostResult) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return }
        
        session.dataTask(with: url) { [ weak self ] data, response, error in
            
            var result: ObtainPostResult
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            if error == nil, let parsData = data {
                
                guard let post = try? self?.decoder.decode([Post].self, from: parsData) else {
                    result = .success(post: [])
                    return
                    
                }
                result = .success(post: post)
               
            } else {
                result = .failure(error: error!)
            }
            
            
        }.resume()
    }
    
}
