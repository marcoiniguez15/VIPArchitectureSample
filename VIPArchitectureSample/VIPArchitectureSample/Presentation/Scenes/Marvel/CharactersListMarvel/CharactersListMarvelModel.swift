//
//  CharactersListMarvelModel.swift
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

enum CharactersListMarvelModel {
  
  enum Request {
    case prepareCharactersListMarvel(page: Int)
    case itemPressed(index: Int)
  }
  
  enum Response {
    case prepareCharactersListMarvel(data: [CharactersListMarvelItemEntity])
    case showError(model: ErrorModel)
    case showDetail(id: Int)
  }
  
  enum ViewModel {
    case showError(model: ErrorModel)
    case prepareCharactersListMarvel(viewModelData: ViewDataSource)
    case showDetail(id: Int)
  }
  
  enum Route {
    case showCharacterDetailMarvel(id: Int)
    case showError(model: ErrorModel)
  }
  
  struct ViewDataSource {
    let title: String
    let items: [CellModel]
  }
  
  struct CellModel {
    let name: String
    let imageName: String?
  }

  
  struct DataSource {
    var characterList: [CharactersListMarvelItemEntity] = []
  }
}