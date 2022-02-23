//
//  CharactersListFactorable.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

extension AppInjector {
  
  struct CharactersListInjector {}
}

extension AppInjector.CharactersListInjector: CharactersListFactorable {}

protocol CharactersListFactorable: CharactersListInteractorFactorable, CharactersListPresenterFactorable, CharactersListRouterFactorable, CharactersListServicesFactorable { }

protocol CharactersListInteractorFactorable {
  typealias InteractableFactory = CharactersListPresenterFactorable & CharactersListServicesFactorable
  
  func makeInteractor(factory: InteractableFactory, viewController: CharactersListDisplayLogic?, dataSource: CharactersListModel.DataSource) -> CharactersListInteractable
}

protocol CharactersListPresenterFactorable {
  func makePresenter(viewController: CharactersListDisplayLogic?) -> CharactersListPresentationLogic
}

protocol CharactersListRouterFactorable {
  func makeRouter(viewController: UIViewController?) -> CharactersListRouting
}

extension CharactersListFactorable {
  
  func makeInteractor(factory: InteractableFactory, viewController: CharactersListDisplayLogic?, dataSource: CharactersListModel.DataSource) -> CharactersListInteractable {
    CharactersListInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
  }
  
  func makePresenter(viewController: CharactersListDisplayLogic?) -> CharactersListPresentationLogic {
    CharactersListPresenter(viewController: viewController)
  }
  
  func makeRouter(viewController: UIViewController?) -> CharactersListRouting {
    CharactersListRouter(viewController: viewController)
  }
}


// MARK: - Service Factorable
protocol CharactersListServicesFactorable {
  
  func makeApiService() -> APIClientProtocol
}

extension CharactersListServicesFactorable {
  
  func makeApiService() -> APIClientProtocol {
    APIClient.shared
  }
}
