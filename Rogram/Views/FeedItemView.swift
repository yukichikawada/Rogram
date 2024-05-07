//
//  FeedItemView.swift
//  Rogram
//
//  Created by Yukichi Kawada on 5/7/24.
//

import SwiftUI

struct FeedItemView: View {
    let photo: Photo
    
    var body: some View {
        VStack {
            imageBlock
            descriptionBlock
        }
        .frame(width: 350)
        .border(.red, width: 2)
    }
}

private extension FeedItemView {
    /// Returns the specified image or a placeholder image
    var imageBlock: some View {
        AsyncImage(url: URL(string: photo.url)) { image in
            image.resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
        } placeholder: {
            Rectangle()
                .frame(width: 350, height: 350)
        }
    }
    
    /// Returns a container for the title and heart icon
    var descriptionBlock: some View {
        HStack {
            Text(photo.title)
                .multilineTextAlignment(.leading)
                .font(.caption)
                .padding()
            Spacer()
            Image(systemName: "heart.fill")
                .padding()
        }
    }
}

#Preview {
    FeedItemView(photo: Photo(albumId: 1, id: 1, title: "Lorem Ipsum", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"))
}
