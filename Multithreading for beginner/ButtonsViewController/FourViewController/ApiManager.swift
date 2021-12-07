//
//  ApiManager.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 07.12.2021.
//

import Foundation

enum ApiType {
    case getUsers
    case getPosts
    case getAlbums
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var path: String {
        switch self {
        case .getAlbums: return "albums"
        case .getPosts: return "posts"
        case .getUsers: return "users"
        }
    }
    
    var request: URLRequest {
        let baseURL = URL(string: baseURL)!
        let url = URL(string: path, relativeTo: baseURL)!
        let request = URLRequest(url: url)
        
        return request
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    func getUsers(completion: @escaping (Users) -> ()) {
        let request = ApiType.getUsers.request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data) {
                completion(users)
            }
        }.resume()
    }
    
    func getAlbums(completion: @escaping (Album) -> ()) {
        let request = ApiType.getUsers.request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let albums = try? JSONDecoder().decode(Album.self, from: data) {
                
            }
        }.resume()
    }
    
    func getPosts(completion: @escaping ([Post]) -> ()) {
        let request = ApiType.getUsers.request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let posts = try? JSONDecoder().decode(Post.self, from: data) {
                
            }
        }.resume()
    }

}
























