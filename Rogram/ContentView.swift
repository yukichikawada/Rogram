//
//  ContentView.swift
//  Rogram
//
//  Created by Yukichi Kawada on 5/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                FeedView(viewModel: FeedViewModel())
            }
            .navigationTitle("Ro")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
