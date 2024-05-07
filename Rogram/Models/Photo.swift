//
//  Photo.swift
//  Rogram
//
//  Created by Yukichi Kawada on 5/7/24.
//

import Foundation

struct Photo: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
