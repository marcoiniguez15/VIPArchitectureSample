//
//  ArtistsListInteractor.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import Foundation

typealias ArtistsListInteractable = ArtistsListBusinessLogic & ArtistsListDataStore

protocol ArtistsListBusinessLogic {
  
  func doRequest(_ request: ArtistsListModel.Request)
}

protocol ArtistsListDataStore {
  var dataSource: ArtistsListModel.DataSource { get }
}

final class ArtistsListInteractor: ArtistsListDataStore {
  
  var dataSource: ArtistsListModel.DataSource
  
  private var factory: ArtistsListInteractorFactorable.InteractableFactory
  private var presenter: ArtistsListPresentationLogic
  
  init(factory: ArtistsListInteractorFactorable.InteractableFactory, viewController: ArtistsListDisplayLogic?, dataSource: ArtistsListModel.DataSource) {
    self.factory = factory
    self.dataSource = dataSource
    self.presenter = factory.makePresenter(viewController: viewController)
  }
}


// MARK: - ArtistsListBusinessLogic
extension ArtistsListInteractor: ArtistsListBusinessLogic {
  
  func doRequest(_ request: ArtistsListModel.Request) {
    DispatchQueue.global(qos: .userInitiated).async {
      
      switch request {
        
      case let .prepareArtistList(page):
        self.prepareArtistList(page: page)
        
      case let .itemPressed(index):
        if let id = self.dataSource.artistList[index].mbid {
          self.presenter.presentResponse(.showDetail(id: id))
        }
      }
    }
  }
}


// MARK: - Private Zone
private extension ArtistsListInteractor {
  
  func prepareArtistList(page: Int) {
    
    let service = factory.makeApiService()
    if page == 1 {
      LoaderView.toggleUniversalLoadingView(true)
    }
    service.getCharactersListLastFM(limit: 50, page: page) { (result, _) in
      LoaderView.toggleUniversalLoadingView(false)
      switch result {
      case let .success(list):
        if let data = list.artists, let artists = data.artist {
          self.dataSource.artistList.append(contentsOf: artists)
          self.presenter.presentResponse(.prepareArtistList(data: self.dataSource.artistList))
        }
      case .failure:
        let errorModel = ErrorHelper.createGenericError()
        self.presenter.presentResponse(.showError(model: errorModel))
      }
    }
  }
}