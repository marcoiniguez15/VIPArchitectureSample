//
//  CharactersListRickMortyFactorable.swift
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
  
  struct CharactersListRickMortyInjector {}
}

extension AppInjector.CharactersListRickMortyInjector: CharactersListRickMortyFactorable {}

protocol CharactersListRickMortyFactorable: CharactersListRickMortyInteractorFactorable, CharactersListRickMortyPresenterFactorable, CharactersListRickMortyRouterFactorable, CharactersListRickMortyServicesFactorable { }

protocol CharactersListRickMortyInteractorFactorable {
  typealias InteractableFactory = CharactersListRickMortyPresenterFactorable & CharactersListRickMortyServicesFactorable
  
  func makeInteractor(factory: InteractableFactory, viewController: CharactersListRickMortyDisplayLogic?, dataSource: CharactersListRickMortyModel.DataSource) -> CharactersListRickMortyInteractable
}

protocol CharactersListRickMortyPresenterFactorable {
  func makePresenter(viewController: CharactersListRickMortyDisplayLogic?) -> CharactersListRickMortyPresentationLogic
}

protocol CharactersListRickMortyRouterFactorable {
  func makeRouter(viewController: UIViewController?) -> CharactersListRickMortyRouting
}

extension CharactersListRickMortyFactorable {
  
  func makeInteractor(factory: InteractableFactory, viewController: CharactersListRickMortyDisplayLogic?, dataSource: CharactersListRickMortyModel.DataSource) -> CharactersListRickMortyInteractable {
    CharactersListRickMortyInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
  }
  
  func makePresenter(viewController: CharactersListRickMortyDisplayLogic?) -> CharactersListRickMortyPresentationLogic {
    CharactersListRickMortyPresenter(viewController: viewController)
  }
  
  func makeRouter(viewController: UIViewController?) -> CharactersListRickMortyRouting {
    CharactersListRickMortyRouter(viewController: viewController)
  }
}


// MARK: - Service Factorable
protocol CharactersListRickMortyServicesFactorable {
  
  func makeApiService() -> APIClientProtocol
}

extension CharactersListRickMortyServicesFactorable {
  
  func makeApiService() -> APIClientProtocol {
    APIClient.shared
  }
}