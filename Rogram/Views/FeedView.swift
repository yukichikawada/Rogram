//
//  FeedView.swift
//  Rogram
//
//  Created by Yukichi Kawada on 5/7/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel
    @State private var isPresented = false
    @State private var selectedPhoto: Photo?
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.feed) { photo in
                    Button {
                        selectedPhoto = photo
                        isPresented.toggle()
                    } label: {
                        FeedItemView(photo: photo)
                    }
                    .padding(16)
                }
            }
            .fullScreenCover(item: $selectedPhoto) { item in
                PhotoDetailView(photo: item)
            }
        }
    }
}

#Preview {
    FeedView(viewModel: FeedViewModel())
}
