//
//  CharactersListMarvelInteractor.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import Foundation

typealias CharactersListMarvelInteractable = CharactersListMarvelBusinessLogic & CharactersListMarvelDataStore

protocol CharactersListMarvelBusinessLogic {
  
  func doRequest(_ request: CharactersListMarvelModel.Request)
}

protocol CharactersListMarvelDataStore {
  var dataSource: CharactersListMarvelModel.DataSource { get }
}

final class CharactersListMarvelInteractor: CharactersListMarvelDataStore {
  
  var dataSource: CharactersListMarvelModel.DataSource
  
  private var factory: CharactersListMarvelInteractorFactorable.InteractableFactory
  private var presenter: CharactersListMarvelPresentationLogic
  
  init(factory: CharactersListMarvelInteractorFactorable.InteractableFactory, viewController: CharactersListMarvelDisplayLogic?, dataSource: CharactersListMarvelModel.DataSource) {
    self.factory = factory
    self.dataSource = dataSource
    self.presenter = factory.makePresenter(viewController: viewController)
  }
}


// MARK: - CharactersListMarvelBusinessLogic
extension CharactersListMarvelInteractor: CharactersListMarvelBusinessLogic {
  
  func doRequest(_ request: CharactersListMarvelModel.Request) {
    DispatchQueue.global(qos: .userInitiated).async {
      
      switch request {
        
      case let .prepareCharactersListMarvel(page):
        self.prepareCharactersListMarvel(page: page)
        
      case let .itemPressed(index):
        if let id = self.dataSource.characterList[index].id {
          self.presenter.presentResponse(.showDetail(id: id))
        }
      }
    }
  }
}


// MARK: - Private Zone
private extension CharactersListMarvelInteractor {
  
  func prepareCharactersListMarvel(page: Int) {
    let service = factory.makeApiService()
    if page == 0 {
      LoaderView.toggleUniversalLoadingView(true)
    }
    service.getCharactersListMarvel(page: page) { (result, _) in
      LoaderView.toggleUniversalLoadingView(false)
      switch result {
      case let .success(list):
        if let data = list.data, let results = data.results {
          self.dataSource.characterList.append(contentsOf: results)
          self.presenter.presentResponse(.prepareCharactersListMarvel(data: self.dataSource.characterList))
        }
      case .failure:
        let errorModel = ErrorHelper.createGenericError()
        self.presenter.presentResponse(.showError(model: errorModel))
      }
    }
  }
}
