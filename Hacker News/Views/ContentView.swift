//
//  ContentView.swift
//  Hacker News
//
//  Created by Yeoh Hui Qing on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() // NetworkManager must conform to ObservedObject protocol
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) { // destination is outcome of navigation
                    HStack { // closure is what is displayed before navigation
                        Text(String(post.points))
                            .foregroundColor(.secondary)
                        Text(post.title)
                    }
                    .padding(.vertical, 12)
                }
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear { // similar to viewDidLoad()
            self.networkManager.fetchPosts()
        }
    }
}

#Preview {
    ContentView()
}
