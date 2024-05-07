//
//  PhotoDetailView.swift
//  Rogram
//
//  Created by Yukichi Kawada on 5/7/24.
//

import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            dismissButton
            Spacer()
            imageBlock
            descriptionBlock
            Spacer()
        }
    }
}

private extension PhotoDetailView {
    var dismissButton: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "x.circle")
                    .font(.title2)
                    .padding()
            }
        }
    }
    
    /// Returns the specified image or a placeholder image
    var imageBlock: some View {
        AsyncImage(url: URL(string: photo.url)) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
    
    var descriptionBlock: some View {
        Text(photo.title)
            .font(.headline)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    PhotoDetailView(photo: Photo(albumId: 1,
                                 id: 1,
                                 title: "Lorem Ipsum",
                                 url: "https://via.placeholder.com/600/92c952",
                                 thumbnailUrl: "https://via.placeholder.com/150/92c952"))
}
