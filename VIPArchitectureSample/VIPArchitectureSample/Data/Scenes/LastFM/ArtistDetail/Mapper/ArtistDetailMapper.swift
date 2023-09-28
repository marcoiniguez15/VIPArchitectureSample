//
//  ArtistDetailMapper.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct ArtistDetailMapper: ArtistDetailMapperContract {
    func map(_ data: AlbumsLastFM) throws -> ArtistDetailEntity {
        var title = "Top Albums"
        if let topAlbums = data.topalbums, let albums = topAlbums.album {
            if let attr = topAlbums.attr, let artist = attr.artist {
                title += "-" + artist
            }

            let items = albums.compactMap { album -> ArtistDetailItemEntity? in
                var imageURL = URL(string: "")
                if let imageArray = album.image {
                    let imageURLs = imageArray.compactMap { (imageDictionary) -> URL? in
                        if let imageSize = imageDictionary.size, imageSize == ArtistsConstants.imageSizeValue,
                           let imageURLString = imageDictionary.text {
                            return URL(string: imageURLString)
                        } else if  let imageURLString = imageDictionary.text {
                            return URL(string: imageURLString)
                        }

                        return nil
                    }
                    imageURL = imageURLs.last
                }
                if let name = album.name, let rank = album.playcount, let id = album.mbid {
                    return ArtistDetailItemEntity(title: name, rank: String(rank), imageURL: imageURL, description: id)
                }
                return nil
            }
            return ArtistDetailEntity(title: title, items: items)
        }
        throw CustomNetworkError.decode
    }
}
