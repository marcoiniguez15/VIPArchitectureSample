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
    let artist: String?
    let album: [Album]?
    
    enum CodingKeys: String, CodingKey {
        case artist = "-artist"
        case album
    }
}

struct Album: Codable {
    let rank, name, mbid, listeners: String?
    let url: String?
    let image: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case rank = "-rank"
        case name, mbid, listeners, url, image
    }
}
