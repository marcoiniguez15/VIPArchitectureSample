//
//  CharacterDetailMarvelFactorable.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 6/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit


extension AppInjector {
  
  struct CharacterDetailMarvelInjector {}
}

extension AppInjector.CharacterDetailMarvelInjector: CharacterDetailMarvelFactorable {}

protocol CharacterDetailMarvelFactorable: CharacterDetailMarvelInteractorFactorable, CharacterDetailMarvelPresenterFactorable, CharacterDetailMarvelRouterFactorable, CharacterDetailMarvelServicesFactorable { }

protocol CharacterDetailMarvelInteractorFactorable {
  typealias InteractableFactory = CharacterDetailMarvelPresenterFactorable & CharacterDetailMarvelServicesFactorable
  
  func makeInteractor(factory: InteractableFactory, viewController: CharacterDetailMarvelDisplayLogic?, dataSource: CharacterDetailMarvelModel.DataSource) -> CharacterDetailMarvelInteractable
}

protocol CharacterDetailMarvelPresenterFactorable {
  func makePresenter(viewController: CharacterDetailMarvelDisplayLogic?) -> CharacterDetailMarvelPresentationLogic
}

protocol CharacterDetailMarvelRouterFactorable {
  func makeRouter(viewController: UIViewController?) -> CharacterDetailMarvelRouting
}

extension CharacterDetailMarvelFactorable {
  
  func makeInteractor(factory: InteractableFactory, viewController: CharacterDetailMarvelDisplayLogic?, dataSource: CharacterDetailMarvelModel.DataSource) -> CharacterDetailMarvelInteractable {
    CharacterDetailMarvelInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
  }
  
  func makePresenter(viewController: CharacterDetailMarvelDisplayLogic?) -> CharacterDetailMarvelPresentationLogic {
    CharacterDetailMarvelPresenter(viewController: viewController)
  }
  
  func makeRouter(viewController: UIViewController?) -> CharacterDetailMarvelRouting {
    CharacterDetailMarvelRouter(viewController: viewController)
  }
}


// MARK: - Service Factorable
protocol CharacterDetailMarvelServicesFactorable {
  func makeApiService() -> APIClientProtocol
}

extension CharacterDetailMarvelServicesFactorable {
  
  func makeApiService() -> APIClientProtocol {
    APIClient.shared
  }
}
