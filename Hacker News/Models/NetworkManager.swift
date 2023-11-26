//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Yeoh Hui Qing on 26/11/23.
//

import Foundation

class NetworkManager: ObservableObject { // Observable for any subscribers
    
    @Published var posts = [Post]() // @Published is a property wrapper, works like RSS feeds
    
    func fetchPosts() {
        fetchData("https://hn.algolia.com/api/v1/search?tags=front_page")
    }
    
    func fetchData(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let data = data {
                        do {
                            let results = try decoder.decode(Results.self, from: data)
                            DispatchQueue.main.async { // Always use main thread to get updates in a timely fashion
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
