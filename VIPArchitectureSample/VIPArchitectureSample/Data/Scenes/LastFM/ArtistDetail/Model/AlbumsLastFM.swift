//
//  AlbumsLastFM.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import Foundation
struct AlbumsLastFM: Codable {
    let topalbums: Topalbums?
}

struct Topalbums: Codable {
      let album: [Album]?
      let attr: AttrAlbum?
    
    enum CodingKeys: String, CodingKey {
        case attr = "@attr"
        case album
    }
}

struct Album: Codable {
    let name: String?
    let playcount: Int?
    let mbid: String?
    let url: String?
    let artist: Artist?
    let image: [Image]?
}

// MARK: - AttrAlbum
struct AttrAlbum: Codable {
    let artist: String?
}
