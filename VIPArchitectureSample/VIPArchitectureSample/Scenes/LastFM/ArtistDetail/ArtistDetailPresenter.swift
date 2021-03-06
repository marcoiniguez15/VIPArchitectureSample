//
//  ArtistDetailPresenter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 24/2/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import Foundation
import UIKit

protocol ArtistDetailPresentationLogic {
  func presentResponse(_ response: ArtistDetailModel.Response)
}

final class ArtistDetailPresenter {
  private weak var viewController: ArtistDetailDisplayLogic?
  
  init(viewController: ArtistDetailDisplayLogic?) {
    self.viewController = viewController
  }
}


// MARK: - ArtistDetailPresentationLogic
extension ArtistDetailPresenter: ArtistDetailPresentationLogic {
  
  func presentResponse(_ response: ArtistDetailModel.Response) {
    
    switch response {
      
    case let .prepareView(info):
      self.prepareView(data: info)
      
    case let .showError(model):
      self.viewController?.displayViewModel(.showError(model: model))
    }
  }
}


// MARK: - Private Zone
private extension ArtistDetailPresenter {
  
  func prepareView(data: AlbumsLastFM) {
    var title = "Top Albums"
    
    if let topAlbums = data.topalbums, let albums = topAlbums.album {
      if let attr = topAlbums.attr, let artist = attr.artist {
        title += "-" + artist
      }
    
    let viewModels = albums.compactMap { album -> ArtistDetailModel.CellModel in
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
      return ArtistDetailModel.CellModel(title: album.name ?? "Name", rank: String(album.playcount ?? 0), imageURL: imageURL, description:  album.mbid ?? "0")
      }
      self.viewController?.displayViewModel(.prepareView(viewModelData: ArtistDetailModel.ViewDataSource(title: title, items: viewModels)))
    }
  }
}
