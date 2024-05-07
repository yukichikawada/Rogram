//
//  FeedViewModel.swift
//  Rogram
//
//  Created by Yukichi Kawada on 5/7/24.
//

import Foundation

enum Constants: String {
    case baseUrl = "https://jsonplaceholder.typicode.com"
    case album1photos = "/albums/1/photos"
}

class FeedViewModel: ObservableObject {
    @Published var feed: [Photo] = [Photo]()
    
    init() {
        fetchPhotos()
    }
    
    func fetchPhotos() {
        Task { @MainActor in
            do {
                guard let url = URL(string: Constants.baseUrl.rawValue + Constants.album1photos.rawValue) else { return }
                let (data, _) = try await URLSession.shared.data(from: url)
                feed = try JSONDecoder().decode([Photo].self, from: data)
            } catch {
                print("FAILED: Did not fetch photos - ", error.localizedDescription)
            }
        }
    }
}
