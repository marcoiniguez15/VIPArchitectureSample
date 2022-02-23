//
//  InitialSelectionPresenter.swift
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

protocol InitialSelectionPresentationLogic {
  func presentResponse(_ response: InitialSelectionModel.Response)
}

final class InitialSelectionPresenter {
  private weak var viewController: InitialSelectionDisplayLogic?
  
  init(viewController: InitialSelectionDisplayLogic?) {
    self.viewController = viewController
  }
}


// MARK: - InitialSelectionPresentationLogic
extension InitialSelectionPresenter: InitialSelectionPresentationLogic {
  
  func presentResponse(_ response: InitialSelectionModel.Response) {
    
    switch response {
      
    case .prepareOptions:
      presentOptions()
    }
  }
}


// MARK: - Private Zone
private extension InitialSelectionPresenter {
  
  func presentOptions() {
    
    let viewModel = InitialSelectionModel.ViewDataSource(title: "Selection", questionTitle: "What do you want to see?", titleLastFMButton: "LastFM", titleRickMortyButton: "Rick and Morty", titleMarvelButton: "Marvel")
    
    viewController?.displayViewModel(.prepareOptions(viewModelData: viewModel))
  }
}
