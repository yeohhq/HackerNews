//
//  DetailView.swift
//  Hacker News
//
//  Created by Yeoh Hui Qing on 26/11/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}
